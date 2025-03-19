import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/theme.dart';
import '../../provider/task_provider.dart';

class DailyActivitiesScreen extends StatefulWidget {
  const DailyActivitiesScreen({super.key});

  @override
  State<DailyActivitiesScreen> createState() => _DailyActivitiesScreenState();
}

class _DailyActivitiesScreenState extends State<DailyActivitiesScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late DateTime today;
  late int currentDay;
  late List<DateTime> dates;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  double _prevProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    today = DateTime.now();
    currentDay = today.day;
    dates =
        List.generate(7, (index) => today.subtract(Duration(days: 3 - index)));

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  void _scrollToToday() {
    final todayIndex = dates.indexWhere((date) => date.day == currentDay);
    if (todayIndex != -1) {
      const todayItemWidth = 75.0;
      const regularItemWidth = 50.0;
      const itemPadding = 8.0;

      double position = 0;

      for (int i = 0; i < todayIndex; i++) {
        position += regularItemWidth + itemPadding;
      }

      final screenWidth = MediaQuery.of(context).size.width;
      final offset = position - (screenWidth / 2) + (todayItemWidth / 2);

      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          offset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void _animateProgress(double end) {
    setState(() {
      _progressAnimation = Tween<double>(
        begin: _prevProgress,
        end: end,
      ).animate(CurvedAnimation(
        parent: _progressController,
        curve: Curves.easeInOut,
      ));

      _prevProgress = end;
      _progressController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;
    final completedTasks = taskProvider.completedTasksCount;
    final totalTasks = taskProvider.totalTasksCount;

    final progressValue = totalTasks > 0 ? completedTasks / totalTasks : 0.0;

    if (_prevProgress != progressValue) {
      _animateProgress(progressValue);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Activities'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: dates.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final date = dates[index];
                final isToday = _isSameDay(date, today);
                final isSelected = _isSameDay(date, taskProvider.selectedDate);

                return GestureDetector(
                  onTap: () {
                    taskProvider.setSelectedDate(date);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: isToday ? 75 : 50,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppTheme.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: isSelected
                            ? Border.all(
                                width: 0,
                              )
                            : Border.all(
                                width: 1,
                                color: const Color.fromRGBO(232, 232, 232, 1),
                              ),
                      ),
                      child: Text(
                        isToday ? 'Today' : '${date.day}',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(22.0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(232, 232, 232, 1),
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Activities Progress',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      'Activities',
                    ),
                    const Spacer(),
                    Text(
                      '$completedTasks/$totalTasks',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _progressController,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      value: _progressController.isAnimating
                          ? _progressAnimation.value
                          : progressValue,
                      backgroundColor: const Color.fromRGBO(232, 232, 232, 1),
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.primaryColor,
                      minHeight: 8,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: tasks.isEmpty
                ? const Text('No Tasks Assigned')
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minTileHeight: 20,
                        leading: Checkbox(
                          value: tasks[index].isCompleted,
                          visualDensity: VisualDensity.compact,
                          onChanged: (value) =>
                              taskProvider.toggleTaskCompletion(index, value!),
                        ),
                        horizontalTitleGap: -4,
                        title: Text(
                          tasks[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: tasks[index].isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.black54,
                            decorationThickness: 2,
                            color: tasks[index].isCompleted
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

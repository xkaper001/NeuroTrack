import 'package:flutter/foundation.dart';
import 'package:patient/presentation/activities/model/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _allTasks = [];
  DateTime _selectedDate = DateTime.now();

  TaskProvider() {
    _initializeTasks();
  }

  void _initializeTasks() {
    // Created tasks for demo purposes
    // TODO: Replace demo tasks with backend data from supabase
    final today = DateTime.now();
    
    _allTasks.addAll([
      Task(title: 'Brush Teeth', isCompleted: false, date: today),
      Task(title: 'Have Breakfast', isCompleted: false, date: today),
      Task(title: 'Take Medications', isCompleted: false, date: today),
      Task(title: 'Morning Walk', isCompleted: false, date: today),
      Task(title: 'Read a Book', isCompleted: false, date: today),
    ]);

    final yesterday = today.subtract(const Duration(days: 1));
    _allTasks.addAll([
      Task(title: 'Morning Stretching', isCompleted: true, date: yesterday),
      Task(title: 'Language Exercise', isCompleted: true, date: yesterday),
      Task(title: 'Memory Game', isCompleted: false, date: yesterday),
    ]);

    final tomorrow = today.add(const Duration(days: 1));
    _allTasks.addAll([
      Task(title: 'Speech Therapy Exercise', isCompleted: false, date: tomorrow),
      Task(title: 'Cognitive Task', isCompleted: false, date: tomorrow),
      Task(title: 'Balance Training', isCompleted: false, date: tomorrow),
    ]);

  }

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  List<Task> get tasks {
    return _allTasks.where((task) => 
      task.date.year == _selectedDate.year &&
      task.date.month == _selectedDate.month &&
      task.date.day == _selectedDate.day
    ).toList();
  }

  void toggleTaskCompletion(int index, bool isCompleted) {
    final tasksForDay = tasks;
    if (index >= 0 && index < tasksForDay.length) {
      final taskIndex = _allTasks.indexOf(tasksForDay[index]);
      if (taskIndex != -1) {
        _allTasks[taskIndex].isCompleted = isCompleted;
        notifyListeners();
      }
    }
  }

  int get completedTasksCount =>
      tasks.where((task) => task.isCompleted).length;
      
  int get totalTasksCount => tasks.length;
}

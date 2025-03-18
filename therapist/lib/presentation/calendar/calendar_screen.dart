import 'package:flutter/material.dart';
import '../widget/session_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedDay = 11; // Today (11th)
  String _selectedFilter = 'All';

  final List<String> _days = ['9', '10', '11', '12', '13', '14'];
  final List<String> _filters = ['All', 'Pending', 'Cancelled', 'Completed'];
  final Map<String, int> _filterCounts = {
    'All': 12,
    'Pending': 2,
    'Cancelled': 1,
    'Completed': 1,
  };

  // Sample session data
  final List<Map<String, dynamic>> _allSessions = [
    {
      'patientName': 'Patient Name',
      'patientId': '#1243384',
      'phone': '+91 1234567890',
      'therapyName': 'Therapy Name',
      'therapyMode': 'Offline',
      'time': '10: 30 AM',
      'duration': '1 hour 20 mins',
      'status': 'Pending',
    },
    {
      'patientName': 'Patient Name',
      'patientId': '#685863',
      'phone': '+91 1234567890',
      'therapyName': 'Therapy Name',
      'therapyMode': 'Offline',
      'time': '12: 00 PM',
      'duration': '1 hour 20 mins',
      'status': 'Pending',
    },
    {
      'patientName': 'Mohammed Mohsin',
      'patientId': '#75677',
      'phone': '+91 1234567890',
      'therapyName': 'Therapy Name',
      'therapyMode': 'Offline',
      'time': '04: 30 PM',
      'duration': '1 hour 20 mins',
      'status': 'Cancelled',
      'cancelMessage': 'Mohammed Mohsin won\'t be attending the session today',
    },
    {
      'patientName': 'Patient Name',
      'patientId': '#1243384',
      'phone': '+91 1234567890',
      'therapyName': 'Therapy Name',
      'therapyMode': 'Offline',
      'time': '10: 30 AM',
      'duration': '1 hour 20 mins',
      'status': 'Completed',
    },
  ];

  List<Map<String, dynamic>> get _filteredSessions {
    if (_selectedFilter == 'All') {
      return _allSessions;
    } else {
      return _allSessions
          .where((session) => session['status'] == _selectedFilter)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Schedule',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Day selector
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  itemBuilder: (context, index) {
                    final day = _days[index];
                    final isSelected = int.parse(day) == _selectedDay;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = int.parse(day);
                        });
                      },
                      child: Container(
                        width: 60,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFD580FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            isSelected ? 'Today' : day,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Filter tabs
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = filter == _selectedFilter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? filter == 'All'
                                  ? const Color(0xFFD580FF)
                                  : filter == 'Pending'
                                      ? Colors.grey[300]
                                      : filter == 'Cancelled'
                                          ? Colors.grey[300]
                                          : const Color(0xFFD580FF)
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '${filter} (${_filterCounts[filter]})',
                            style: TextStyle(
                              color: isSelected
                                  ? (filter == 'All' || filter == 'Completed'
                                      ? Colors.white
                                      : Colors.black)
                                  : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Session cards
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredSessions.length,
                  itemBuilder: (context, index) {
                    final session = _filteredSessions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SessionCard(
                        patientName: session['patientName'],
                        patientId: session['patientId'],
                        phone: session['phone'],
                        therapyName: session['therapyName'],
                        therapyMode: session['therapyMode'],
                        time: session['time'],
                        duration: session['duration'],
                        status: session['status'],
                        cancelMessage: session['cancelMessage'],
                      ),
                    );
                  },
                ),
              ),
              // Can't take this session button
              if (_selectedFilter == 'Pending')
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Can\'t take this session?',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

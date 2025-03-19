
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TherapyGoalsScreen extends StatefulWidget {
  const TherapyGoalsScreen({Key? key}) : super(key: key);

  @override
  _TherapyGoalsScreenState createState() => _TherapyGoalsScreenState();
}

class _TherapyGoalsScreenState extends State<TherapyGoalsScreen> {
  int selectedTabIndex = 0; // 0 for Goals, 1 for Achievements, 2 for Observations
  String selectedDate = "Today"; 
  List<String> getDatesList() {
    DateTime now = DateTime.now();
    int today = now.day;
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    List<String> dates = [];
    for (int i = today - 3; i <= today + 3; i++) {
      if (i > 0 && i <= daysInMonth) {
        dates.add(i == today ? "Today" : i.toString());
      }
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    List<String> dates = getDatesList();
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Therapy Goals"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker Bar
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = dates[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                      child: Chip(
                        label: Text(
                          dates[index],
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.w600,
                            color: selectedDate == dates[index] ? Colors.white : Colors.black,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        backgroundColor: selectedDate == dates[index]
                            ? const Color(0xFF7A86F8) 
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Therapy Card
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(82, 158, 158, 158), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/therapist_img.png'),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Therapist Name",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "Neurologist",
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoColumn("Therapy", "Therapy Name"),
                      _buildInfoColumn("Done at", "05:30 PM"),
                    ],
                  ),
                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoColumn("Therapy Mode", "Offline"),
                      _buildInfoColumn("Duration", "1 hour 20 mins"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Tab Selection
            Container(
              padding: EdgeInsets.all(6),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabButton("Goals", 0),
                  _buildTabButton("Achievements", 1),
                  _buildTabButton("Observations", 2),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Content Display
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _buildContent(selectedTabIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 10),
        decoration: BoxDecoration(
          color: selectedTabIndex == index ? const Color(0xFF7A86F8) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: selectedTabIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }

  Widget _buildContent(int index) {
    List<String> goals = [
      "A heartbeat is a two-part pumping action that takes about a second.",
      "As blood collects in the upper chambers (the right and left atria).",
      "The heart's natural pacemaker (the SA node) sends out an electrical signal.",
    ];

    List<String> achievements = [
      "Completed therapy session successfully.",
      "Improved heart rate by 10%.",
      "Better response to electrical signals.",
    ];

    List<String> observations = [
      "Patient showed increased stamina during exercise.",
      "Heart rate normalized faster than last session.",
      "Slight fatigue observed after extended activity.",
    ];

    List<String> data = index == 0 ? goals : (index == 1 ? achievements : observations);

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${i + 1}. ${data[i]}",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
          ),
        );
      },
    );
  }
}

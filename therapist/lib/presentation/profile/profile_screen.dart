import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Profile Title
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Profile Info Section with slight purple background
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EAF5), // Slight purple background
                  borderRadius: BorderRadius.circular(20),
                ),
                constraints: const BoxConstraints(minHeight: 160),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/rohit.png'),
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mohammed Mohsin",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "mohsin@gmail.com",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          "+91 1234567890",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Explicit white background below profile section
            Expanded(
              child: Container(
                color: Colors.white, // Ensures the background below is white
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProfileOption("About Us"),
                      _buildProfileOption("Terms & Conditions"),
                      _buildProfileOption("Privacy Policy"),
                      _buildProfileOption("Contact Admin"),
                      _buildProfileOption("Log Out", isLogout: true),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String title, {bool isLogout = false}) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isLogout ? Colors.red : Colors.black,
              fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: () {},
        ),
        if (!isLogout)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(height: 2, thickness: 1),
          ),
      ],
    );
  }
}

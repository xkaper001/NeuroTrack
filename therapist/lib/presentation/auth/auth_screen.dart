import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB066E4),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.07,
                  left: screenWidth * 0.08,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To,",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Therapy App",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: screenHeight * 0.3,
              child: Image.asset(
                'assets/manage_patients.png',
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Text(
              "Manage Patients",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB066E4),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
              child: Text(
                "Effortlessly manage patients & enhance therapy progress.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == 1 ? 12 : 8,
                  height: index == 1 ? 12 : 8,
                  decoration: BoxDecoration(
                    color: index == 1 ? Color(0xFFB066E4) : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Navigate to HomeScreen when tapped
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                width: screenWidth * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google_logo.png',
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

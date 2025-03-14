import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/google_signin_button.dart';
import '../../widgets/welcome_header.dart'; // Import the WelcomeHeader widget

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Custom Welcome Header
          const WelcomeHeader(),
          const Spacer(),
          // Illustration
          Image.asset('assets/illustration.png', height: 200),
          const SizedBox(height: 35),
          Text(
            'Daily Activities,',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Personalized Daily Activities, Tracked Effortlessly!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 30),
          // Google Sign-in Button
          const GoogleSignInButton(),
          const Spacer(),
        ],
      ),
    );
  }
}

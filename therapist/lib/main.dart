import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './presentation/auth/auth_screen.dart';
// import './presentation/home/home_screen.dart';
import './provider/auth_provider.dart';
import './provider/home_provider.dart';
import './provider/therapist_provider.dart';
import './presentation/widget/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TherapistDataProvider())
      ],
      child: TherapyApp(),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

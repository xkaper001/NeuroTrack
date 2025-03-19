import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './presentation/auth/auth_screen.dart';
import './presentation/home/home_screen.dart';
import './presentation/widget/splash_screen.dart';
import './provider/auth_provider.dart';
import './provider/home_provider.dart';
import './provider/therapist_provider.dart';

void main() {
  // Setting system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Running the app with multiple providers
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TherapistDataProvider()),
      ],
      child: const TherapyApp(),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  const TherapyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Therapist Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
        fontFamily: 'SF Pro Display',
      ),
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}

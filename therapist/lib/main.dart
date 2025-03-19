import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapist/core/theme/theme.dart';
import './provider/auth_provider.dart';
import './provider/home_provider.dart';
import './provider/therapist_provider.dart';
import './provider/consultation_provider.dart';
import './core/services/consultation_service.dart'; // Use proper path
import './presentation/home/home_screen.dart';
import './presentation/widget/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TherapistDataProvider()),
        ChangeNotifierProvider(
          create: (context) => ConsultationProvider(
            ConsultationService(),
          )..fetchConsultationRequests(),
        ),
      ],
      child: TherapyApp(),
    ),
  );
}

class TherapyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get authentication state
    final authProvider = Provider.of<AuthProvider>(context);
    
    return MaterialApp(
      title: 'Therapist App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: authProvider.isAuthenticated ? const HomeScreen() : SplashScreen(),
    );
  }
}

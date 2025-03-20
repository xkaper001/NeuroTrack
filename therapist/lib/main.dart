import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapist/core/theme/theme.dart';
import './provider/auth_provider.dart';
import './provider/home_provider.dart';
import './provider/therapist_provider.dart';
import './provider/consultation_provider.dart';
import './repository/supabase_consultation_repository.dart'; // Using our repository implementation
import './presentation/home/home_screen.dart';
import './presentation/widget/splash_screen.dart';

void main() {
  
  final consultationRepository = SupabaseConsultationRepository(
    supabaseClient: null, 
  );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TherapistDataProvider()),
        ChangeNotifierProvider(
          create: (context) => ConsultationProvider(
            consultationRepository, 
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

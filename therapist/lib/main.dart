import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapist/core/theme/theme.dart';
import 'provider/home_provider.dart';
import 'provider/therapist_provider.dart';
import 'presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => TherapistDataProvider()),
      ],
      child: MaterialApp(
        title: 'Therapist App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}

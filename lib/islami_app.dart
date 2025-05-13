import 'package:flutter/material.dart';
import 'package:islami_app/features/onboarding/ui/onboarding_screen.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

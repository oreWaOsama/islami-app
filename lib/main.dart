import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/shared_preferences_utils.dart';
import 'package:islami_app/core/constants/suras_list.dart';
import 'package:islami_app/core/features/layout/ui/layout_screen.dart';
import 'package:islami_app/core/features/onboarding/ui/onboarding_screen.dart';
import 'package:islami_app/core/features/quran/data/models/sura.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool onboardingComplete = prefs.getBool('onboardingComplete') ?? false;

  for (int i = 0; i < SurasList.arabicQuranSuras.length; i++) {
    SurasList.suras.add(
      Sura(
        nameArabic: SurasList.arabicQuranSuras[i],
        nameEnglish: SurasList.englishQuranSuras[i],
        verses: SurasList.versesCount[i],
        quranIndex: i + 1,
      ),
    );
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecentSurasProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: onboardingComplete ? LayoutScreen() : OnboardingScreen(),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/features/hadith/ui/hadith_screen.dart';
import 'package:islami_app/core/features/quran/ui/quran_screen.dart';
import 'package:islami_app/core/features/radio/ui/radio_screen.dart';
import 'package:islami_app/core/features/salah/ui/salah_screen.dart';
import 'package:islami_app/core/features/sebha/ui/sebha_screen.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    SalahScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: AppColors.primaryColor,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          unselectedItemColor: AppColors.myBlack,
          showUnselectedLabels: false,
          selectedFontSize: 16,
          items: [
            customBottomNavigationBarItem(
              iconPath: "assets/icons/Quran.svg",
              label: "Quran",
            ),
            customBottomNavigationBarItem(
              iconPath: "assets/icons/Hadith.svg",
              label: "Hadith",
            ),
            customBottomNavigationBarItem(
              iconPath: "assets/icons/necklace.svg",
              label: "Sebha",
            ),
            customBottomNavigationBarItem(
              iconPath: "assets/icons/radio.svg",
              label: "Radio",
            ),
            customBottomNavigationBarItem(
              iconPath: "assets/icons/Time.svg",
              label: "Salah",
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem customBottomNavigationBarItem({
    required String iconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: AppColors.myBlack,
        width: 30,
        height: 30,
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.myBlack.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(iconPath, color: Colors.white),
      ),

      label: label,
    );
  }
}

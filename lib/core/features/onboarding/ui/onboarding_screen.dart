import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/features/layout/ui/layout_screen.dart';
import 'package:islami_app/core/features/onboarding/data/models/onboarding_data.dart';
import 'package:islami_app/core/features/onboarding/data/widgets/page_view_body.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Column(children: [Image.asset("assets/onboarding/top.png")]),
          ),
          PageViewBody(
            controller: controller,
            onPageChanged: (index) {
              setState(() {});
              currentPage = index;
            },
          ),

          Row(
            children: [
              currentPage == 0
                  ? Spacer()
                  : TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 450),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
              Spacer(),
              SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 5,
                ),
              ),
              Spacer(),
              currentPage == data.length - 1
                  ? TextButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('onboardingComplete', true);

                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => LayoutScreen()),
                      );
                    },
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  )
                  : TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 450),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

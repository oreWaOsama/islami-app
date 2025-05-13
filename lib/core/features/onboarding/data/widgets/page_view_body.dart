import 'package:flutter/widgets.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/features/onboarding/data/models/onboarding_data.dart';

class PageViewBody extends StatelessWidget {
  final PageController controller;
  final Function(int)? onPageChanged;

  const PageViewBody({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(data[index].imagePath)),
              SizedBox(height: 20),
              Text(
                data[index].title,
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.center,
                data[index].description,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

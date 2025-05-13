class OnboardingData {
  String title;
  String description;
  String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingData> data = [
  OnboardingData(
    title: "Welcome To Islmi App",
    description: "",
    imagePath: "assets/onboarding/onboarding1.png",
  ),
  OnboardingData(
    title: "Welcome To Islami",
    description: "We Are Very Excited To Have You In Our Community",
    imagePath: "assets/onboarding/onboarding2.png",
  ),
  OnboardingData(
    title: "Reading the Quran",
    description: "Read, and your Lord is the Most Generous",
    imagePath: "assets/onboarding/onboarding3.png",
  ),
  OnboardingData(
    title: "Bearish",
    description: "Praise the name of your Lord, the Most High",
    imagePath: "assets/onboarding/onboarding4.png",
  ),
  OnboardingData(
    title: "Holy Quran Radio",
    description:
        "You can listen to the Holy Quran Radio through the application for free and easily",
    imagePath: "assets/onboarding/onboarding5.png",
  ),
];

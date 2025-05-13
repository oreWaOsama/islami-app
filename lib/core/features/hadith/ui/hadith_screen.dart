import 'package:flutter/material.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Hadith Background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

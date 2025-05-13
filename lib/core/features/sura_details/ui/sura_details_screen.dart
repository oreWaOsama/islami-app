import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/constants/shared_preferences_utils.dart';
import 'package:islami_app/core/features/quran/data/models/sura.dart';

import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  final Sura sura;
  const SuraDetailsScreen({super.key, required this.sura});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String fileContent = "";
  late RecentSurasProvider provider;
  @override
  void initState() {
    super.initState();
    readSuraFile();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: AppBar(
        leading: BackButton(color: AppColors.primaryColor),
        centerTitle: true,
        title: Text(
          widget.sura.nameEnglish,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.myBlack,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/logos/sura details logo.png"),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/logos/left.png"),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.sura.nameArabic,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Image.asset("assets/logos/right.png"),
                ],
              ),
            ),
            Text(
              fileContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> readSuraFile() async {
    fileContent = await rootBundle.loadString(
      "assets/Suras/${widget.sura.quranIndex}.txt",
    );

    List<String> lines = fileContent.split("\n");
    for (int i = 0; i < lines.length; i++) {
      lines[i] = lines[i].trim();
      lines[i] += " {${i + 1}} ";
    }
    fileContent = lines.join();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    provider.refreshMostRecentSuras();
  }
}

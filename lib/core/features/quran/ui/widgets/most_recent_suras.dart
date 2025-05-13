import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/constants/shared_preferences_utils.dart';

import 'package:islami_app/features/quran/data/models/sura.dart';
import 'package:provider/provider.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => _MostRecentSurasState();
}

class _MostRecentSurasState extends State<MostRecentSuras> {
  late RecentSurasProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMostRecent();
    });
  }

  Future<void> getMostRecent() async {
    await provider.refreshMostRecentSuras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return provider.mostRecentSuras.isEmpty
        ? Container()
        : Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Most Recently",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.mostRecentSuras.length,
                  itemBuilder: (context, index) {
                    return buildSuraCard(provider.mostRecentSuras[index]);
                  },
                ),
              ),
            ],
          ),
        );
  }

  Widget buildSuraCard(Sura sura) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.17,

      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  sura.nameEnglish,
                  style: TextStyle(
                    color: AppColors.myBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  sura.nameArabic,
                  style: TextStyle(
                    color: AppColors.myBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "${sura.verses} Verses",
                  style: TextStyle(
                    color: AppColors.myBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/most recent.png"),
          ],
        ),
      ),
    );
  }
}

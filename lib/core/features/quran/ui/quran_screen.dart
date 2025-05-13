import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/core/app_colors/app_colors.dart';
import 'package:islami_app/core/constants/shared_preferences_utils.dart';
import 'package:islami_app/core/constants/suras_list.dart';
import 'package:islami_app/features/quran/data/models/sura.dart';
import 'package:islami_app/features/quran/ui/widgets/most_recent_suras.dart';

import 'package:islami_app/features/sura_details/ui/sura_details_screen.dart';
import 'package:provider/provider.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Sura> filtredSuras = SurasList.suras;
  late RecentSurasProvider provider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset("assets/logos/home logo.png")),

          buildSearchTextField(),
          const SizedBox(height: 20),
          MostRecentSuras(),
          const SizedBox(height: 10),
          Text(
            "Suras List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          buildListView(),
        ],
      ),
    );
  }

  buildSearchTextField() {
    var textStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
    );
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/icons/Quran.svg",
            // ignore: deprecated_member_use
            color: AppColors.primaryColor,
            width: 10,
            height: 10,
          ),
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        hintText: "Sura Name",
        // ignore: deprecated_member_use
        hintStyle: textStyle.copyWith(color: Colors.white.withOpacity(0.5)),
      ),
      onChanged: (value) {
        setState(() {
          filtredSuras =
              filtredSuras.where((sura) {
                return sura.nameArabic.contains(value) ||
                    sura.nameEnglish.toLowerCase().contains(
                      value.toLowerCase(),
                    );
              }).toList();
        });
      },
      style: textStyle,
      cursorColor: Colors.white,
    );
  }

  Widget buildListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: filtredSuras.length,
        itemBuilder: (context, index) => buildSuraRow(context, index),
        separatorBuilder: (context, index) => Divider(thickness: 2),
      ),
    );
  }

  Widget buildSuraRow(BuildContext context, int index) {
    provider = Provider.of(context);
    return InkWell(
      onTap: () async {
        provider.addSurasIndex(SurasList.suras[index].quranIndex - 1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuraDetailsScreen(sura: filtredSuras[index]),
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/sura number.png"),
              Text(
                "${filtredSuras[index].quranIndex}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filtredSuras[index].nameEnglish,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${filtredSuras[index].verses} Verses",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Text(
            filtredSuras[index].nameArabic,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

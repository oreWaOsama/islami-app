import 'package:flutter/widgets.dart';
import 'package:islami_app/core/constants/suras_list.dart';
import 'package:islami_app/core/features/quran/data/models/sura.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RecentSurasProvider extends ChangeNotifier {
  List<Sura> mostRecentSuras = [];

  void addSurasIndex(int suraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuras =
        prefs.getStringList("most_recent_suras") ?? [];
    if (mostRecentSuras.contains("$suraIndex")) {
      mostRecentSuras.remove("$suraIndex");
      mostRecentSuras.add("$suraIndex");
    } else {
      mostRecentSuras.add("$suraIndex");
    }

    prefs.setStringList("most_recent_suras", mostRecentSuras);
  }

  Future<void> refreshMostRecentSuras() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Sura> newMostRecentSuras = [];
    List<String> mostRecentSurasAsString =
        prefs.getStringList("most_recent_suras") ?? [];
    for (int i = 0; i < mostRecentSurasAsString.length; i++) {
      var surasIndex = int.parse(mostRecentSurasAsString[i]);
      mostRecentSuras.add(SurasList.suras[surasIndex]);
    }

    mostRecentSuras = newMostRecentSuras.reversed.toList();
    notifyListeners();
  }
}

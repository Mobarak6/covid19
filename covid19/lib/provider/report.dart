import 'dart:convert';

import 'package:covid19/model/country.dart';

import 'package:covid19/model/urls.dart';
import 'package:covid19/model/wordWideModel.dart';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class Report with ChangeNotifier {
  wordWideModel? wideModel;

  // late CountryList countryList;
  List<CountryModel> _list = [];
  List<CountryModel> renderList = [];

  Future<void> worldWide() async {
    final wordWideUri = Uri.parse(Urls.worldWideUrl);
    try {
      final responce = await http.get(wordWideUri);
      if (responce.statusCode < 400) {
        final data = wordWideModel.fromJson(jsonDecode(responce.body));
        wideModel = data;
        notifyListeners();
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //get Country Data
  Future<void> countryData() async {
    try {
      final countryUri = Uri.parse(Urls.countrysUrl);

      final responce = await http.get(countryUri);
      if (responce.statusCode < 400) {
        var value = jsonDecode(responce.body) as List<dynamic>;
        var map = value
            .map((e) => CountryModel(
                  country: e['country'],
                  cases: e['cases'],
                  todayCases: e['todayCases'],
                  deaths: e['deaths'],
                  todayDeaths: e['todayDeaths'],
                  recovered: e['recovered'] == null ? 0 : e['recovered'],
                  active: e['active'] == null ? 0 : e['active'],
                  critical: e['critical'],
                  casesPerOneMillion: e['casesPerOneMillion'],
                  deathsPerOneMillion: e['deathsPerOneMillion'],
                  totalTests: e['totalTests'],
                  testsPerOneMillion: e['testsPerOneMillion'],
                ))
            .toList();
        _list = map;
        // CountryList(map);
        renderList = map;

        notifyListeners();
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  void getSearchList(String getValue) {
    renderList = _list
        .where((element) =>
            element.country.toLowerCase().contains(getValue.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

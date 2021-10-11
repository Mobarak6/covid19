// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

import 'package:covid19/interface/argumentSerialize.dart';
import 'package:covid19/interface/countrySumName.dart';
import 'package:numeral/numeral.dart';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

class CountryModel extends CountrySubName implements ArgumnetSerialize {
  CountryModel({
    required this.country,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.totalTests,
    required this.testsPerOneMillion,
  });

  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"],
        totalTests: json["totalTests"],
        testsPerOneMillion: json["testsPerOneMillion"],
      );

  @override
  String countrySubName() {
    return country.length > 2
        ? country.substring(0, 3)
        : country.substring(0, 2);
  }

  @override
  List<Object> getArgumnet() {
    return [
      country,
      Numeral(cases).value(fractionDigits: 2),
      Numeral(todayCases).value(fractionDigits: 2),
      Numeral(deaths).value(fractionDigits: 2),
      Numeral(todayDeaths).value(fractionDigits: 2),
      Numeral(recovered).value(fractionDigits: 2),
      Numeral(active).value(fractionDigits: 2),
      Numeral(critical).value(fractionDigits: 2),
      Numeral(casesPerOneMillion).value(fractionDigits: 2),
      Numeral(deathsPerOneMillion).value(fractionDigits: 2),
      Numeral(totalTests).value(fractionDigits: 2),
      Numeral(testsPerOneMillion).value(fractionDigits: 2),
    ];
  }

  @override
  List<String> ArgumnetToString() {
    return [
      'Country',
      'Cases',
      'Today Cases',
      'Deaths',
      'Today Deaths',
      'Recovered',
      'Active',
      'Critical',
      'Cases Per OneMillion',
      'Deaths Per OneMillion',
      'Total Tests',
      'Tests Per OneMillion',
    ];
  }
}

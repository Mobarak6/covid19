import 'package:flutter/cupertino.dart';

class wordWideModel with ChangeNotifier {
  late int cases;
  late int deaths;
  late int recovered;

  wordWideModel(
      {required this.cases, required this.deaths, required this.recovered});

  wordWideModel.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }
}

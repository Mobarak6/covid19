import 'dart:developer';

import 'package:covid19/assets/colors/colors.dart';
import 'package:covid19/model/dialogHelper.dart';
import 'package:covid19/provider/report.dart';

import 'package:covid19/widget/CountryCardWidget.dart';
import 'package:covid19/widget/serchbarWidget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Report>(context, listen: false).countryData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: AppColors.bodyColor,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                backgroundColor: AppColors.bodyColor,
                color: Colors.red,
              ),
            );
          } else if (snapshot.hasError) {
            Future.delayed(
                Duration.zero, () => DialogHelper.ShowDialog(context));
            return Container(
              color: AppColors.bodyColor,
            );
          } else
            return Consumer<Report>(
              builder: (context, repotData, _) => Scaffold(
                appBar: AppBar(
                  title: SearchBar(
                    report: repotData,
                  ),
                  elevation: 0,
                  backgroundColor: AppColors.bodyColor,
                ),
                body: Container(
                  color: AppColors.bodyColor,
                  child: ListView.builder(
                    itemCount: repotData.renderList.length,
                    itemBuilder: (context, item) {
                      return CountryCardWidget(
                          repotData: repotData, item: item);
                    },
                  ),
                ),
              ),
            );
        });
  }
}

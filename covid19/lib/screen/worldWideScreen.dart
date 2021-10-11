import 'dart:developer';

import 'package:covid19/assets/colors/colors.dart';
import 'package:covid19/model/dialogHelper.dart';
import 'package:covid19/widget/CardGridWidget.dart';
import 'package:covid19/widget/PiechartWidget.dart';
import 'package:flutter/rendering.dart';

import 'package:covid19/provider/report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WordWideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: Provider.of<Report>(context, listen: false).worldWide(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Future.delayed(Duration.zero, () {
              DialogHelper.ShowDialog(context);
            });
            return Container(
              color: AppColors.bodyColor,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: AppColors.bodyColor,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                backgroundColor: AppColors.bodyColor,
                color: Colors.red,
              ),
            );
          }
          return Consumer<Report>(
            builder: (context, reportData, _) => Scaffold(
              body: Container(
                color: AppColors.bodyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(size.width * 0.05, 0, 0, 0),
                        child: PiechartWidget(
                          dataMap: {
                            'Cases': reportData.wideModel!.cases.toDouble(),
                            'Deaths': reportData.wideModel!.deaths.toDouble(),
                            'Recovered':
                                reportData.wideModel!.recovered.toDouble(),
                          },
                        ),
                      ),
                    ),
                    CardGridWidget(
                      size: size,
                      report: reportData,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

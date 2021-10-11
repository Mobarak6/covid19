import 'package:covid19/assets/colors.dart';
import 'package:covid19/provider/report.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class CardGridWidget extends StatelessWidget {
  const CardGridWidget({
    Key? key,
    required this.size,
    required this.report,
  }) : super(key: key);

  final Size size;
  final Report report;
  Widget itemText(String getText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        getText,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget valueText(String getText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        getText,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 50),
      //color: Colors.red,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: size.height * 0.18,
            width: double.infinity,
            margin:
                EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 0),
            decoration: BoxDecoration(
                color: AppColors.caseColor,
                borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
            // alignment: Alignment.topLeft,
            //color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemText('Cases'),
                FittedBox(
                    child: valueText(
                        (Numeral(report.wideModel!.cases).value()).toString()))
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.18,
                    //width: size.width * 0.40,
                    // margin: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemText('Recovered'),
                        FittedBox(
                            child: valueText(
                                Numeral(report.wideModel!.recovered)
                                    .toString())),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.018,
                ),
                Container(
                  height: size.height * 0.18,
                  width: size.width * 0.35,
                  margin: EdgeInsets.all(size.width * 0.001),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(10, 10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemText('Deaths'),
                      FittedBox(
                          child: valueText(
                              Numeral(report.wideModel!.deaths).toString())),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}

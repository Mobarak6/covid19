import 'package:covid19/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PiechartWidget extends StatelessWidget {
  final Map<String, double> dataMap;
  const PiechartWidget({
    Key? key,
    required this.dataMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      //dataMap: dataMap,
      animationDuration: Duration(seconds: 1),
      centerText: 'Covid-19',
      centerTextStyle: TextStyle(
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),

      chartType: ChartType.ring,
      ringStrokeWidth: 30,
      chartLegendSpacing: 40,
      legendOptions: LegendOptions(
          legendPosition: LegendPosition.right,
          legendTextStyle: TextStyle(color: Colors.white)),
      colorList: [AppColors.caseColor, Colors.red, Colors.green],

      chartValuesOptions: ChartValuesOptions(
        showChartValues: true,
        showChartValuesInPercentage: true,
        chartValueStyle: TextStyle(color: Colors.white),
        showChartValueBackground: false,
      ),
    );
  }
}

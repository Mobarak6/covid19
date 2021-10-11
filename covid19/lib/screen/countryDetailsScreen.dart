import 'package:covid19/assets/colors.dart';
import 'package:covid19/model/country.dart';

import 'package:covid19/widget/PiechartWidget.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  static const String routeName = 'CountryDetailsScreen';
  const CountryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as CountryModel;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bodyColor,
        elevation: 0,
        title: Text(
          item.country,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(44, 39, 121, 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: PiechartWidget(dataMap: {
                'Cases': item.cases.toDouble(),
                'Deaths': item.deaths.toDouble(),
                'Recovered': item.recovered.toDouble(),
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: item.getArgumnet().length,
                itemBuilder: (context, index) => SizedBox(
                  height: size.height * 0.06,
                  child: Card(
                    color: Colors.white70,
                    elevation: 3,
                    shadowColor: Colors.white54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.05),
                            child: Text(
                              item.ArgumnetToString()[index] + '  :',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: Text(
                            item.getArgumnet()[index].toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 5,
              //   crossAxisSpacing: 5.0,
              //   mainAxisSpacing: 5.0,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

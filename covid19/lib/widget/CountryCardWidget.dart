import 'package:covid19/provider/report.dart';
import 'package:covid19/screen/countryDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class CountryCardWidget extends StatelessWidget {
  final Report repotData;
  final int item;

  const CountryCardWidget(
      {Key? key, required this.repotData, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelData = repotData.renderList[item];
    return ListTile(
      subtitle: Text(
        Numeral(modelData.active).value(fractionDigits: 2).toString(),
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      isThreeLine: true,
      onTap: () {
        Navigator.pushNamed(context, CountryDetailScreen.routeName,
            arguments: modelData);
      },
      title: Text(
        repotData.renderList[item].country,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      selectedTileColor: Colors.yellowAccent,
      trailing: Icon(
        Icons.touch_app,
        color: Colors.red[100],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: CircleAvatar(
          // radius: 40,
          child: FittedBox(
            child: Text(
              item.toString(),
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

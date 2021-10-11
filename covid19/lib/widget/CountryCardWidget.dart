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
        'Today',
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, CountryDetailScreen.routeName,
            arguments: modelData);
      },
      title: Text(
        Numeral(modelData.todayCases).toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
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
              modelData.countrySubName.call().toUpperCase(),
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

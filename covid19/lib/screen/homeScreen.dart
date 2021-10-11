import 'package:covid19/assets/colors/colors.dart';
import 'package:covid19/screen/countryScreen.dart';
import 'package:covid19/screen/worldWideScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _onTop(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [
      WordWideScreen(),
      CountryScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.black12,
        backgroundColor: AppColors.bodyColor,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Country'),
        ],
        onTap: _onTop,
        currentIndex: _currentIndex,
      ),
      body: _widgetList.elementAt(_currentIndex),
    );
  }
}

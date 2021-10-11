import 'package:covid19/provider/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Report report;
  SearchBar({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
          hintText: 'Country Search',

          prefixIcon: const Icon(
            Icons.search,
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          report.getSearchList(value);
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static ShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
              title: Text('Message'),
              content: Text(
                'Something Wrong',
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                InkWell(
                  child: Text(
                    'Okey',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                )
              ],
            ));
  }
}

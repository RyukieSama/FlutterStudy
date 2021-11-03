import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Icon(Icons.add_a_photo),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(12),
          ),
          Container(
            color: Colors.green,
            child: Icon(
              Icons.add_alarm,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}

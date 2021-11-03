import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Stack(
        children: [
          Icon(
            Icons.add_alarm,
            size: 100,
            color: Colors.green,
            ),
          Icon(
            Icons.add_a_photo,
            size: 60,
            color: Colors.yellow,
            ),
          Icon(
            Icons.add_a_photo_rounded,
            size: 30,
            color: Colors.blue,
            ),
        ],
      ),
    );
  }
}

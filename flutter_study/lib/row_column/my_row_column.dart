
import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment(1, 0),// x 对 Row 没影响 y 对 Column 无效
      child: Column(
        children: [
          Container(
            child: Icon(Icons.add_a_photo),
            color: Colors.red,
            alignment: Alignment(0,0),
          ),
          Container(
            child: Icon(Icons.add_alarm),
            color: Colors.yellow,
            alignment: Alignment(-1,0),
          ),
          Container(
            child: Icon(Icons.add_alert),
            color: Colors.green,
            alignment: Alignment(1,0),
          ),
        ],
      ),
    );
  }
}
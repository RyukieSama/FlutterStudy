import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
//      alignment: Alignment(1, 0),// x 对 Row 没影响 y 对 Column 无效
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Icon(
              Icons.add_a_photo,
              size: 100,
            ),
            color: Colors.red,
//            alignment: Alignment(0, 0),
          ),
          Container(
            child: Icon(
              Icons.add_alarm,
              size: 50,
            ),
            color: Colors.yellow,
//            alignment: Alignment(-1, 0),
          ),
          Container(
            child: Icon(
              Icons.add_alert,
              size: 30,
            ),
            color: Colors.green,
//            alignment: Alignment(1, 0),
          ),
        ],
      ),
    );
  }
}

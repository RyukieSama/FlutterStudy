import 'package:flutter/material.dart';

class MyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          '文字LRT',
          textDirection: TextDirection.ltr,),
        Text(
          '文字RTL',
          textDirection: TextDirection.rtl,),
        Text(
          'TextStyle',
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          textDirection: TextDirection.ltr,
        )
      ],
    );
  }
}
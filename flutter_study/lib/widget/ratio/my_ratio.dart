import 'package:flutter/material.dart';

class MyRatio extends StatelessWidget {
  const MyRatio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        color: Colors.red,
        width: 100,
        child: const AspectRatio(aspectRatio: 1/3),
      ),
    );
  }
}

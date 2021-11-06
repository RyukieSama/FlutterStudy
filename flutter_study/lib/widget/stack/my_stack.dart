import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(50),
          color: Colors.red,
          child: const Icon(
            Icons.add_alarm,
            size: 200,
            color: Colors.green,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12),
          color: Colors.green,
          child: const Icon(
            Icons.add_a_photo,
            size: 100,
            color: Colors.yellow,
          ),
        ),
        Positioned(
          right: 12,
          top: 12,
          child: Container(
            color: Colors.black,
            child: const Icon(
              Icons.add_a_photo_rounded,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';

int number = 1;

void main() {
  Future.wait([
    Future(() {
      sleep(Duration(seconds: 1));
      print('${DateTime.now()}: 1');
      return "任务1";
    }),
    Future(() {
      sleep(Duration(seconds: 1));
      print('${DateTime.now()}: 2');
      return "任务2";
    }),
    Future(() {
      sleep(Duration(seconds: 1));
      print('${DateTime.now()}: 3');
    }),
    Future(() {
      sleep(Duration(seconds: 1));
      print('${DateTime.now()}: 4');
    }),
    Future(() {
      sleep(Duration(seconds: 1));
      print('${DateTime.now()}: 5');
      return "任务5";
    }),
  ]).then((value) {
    print(value);
  });
}

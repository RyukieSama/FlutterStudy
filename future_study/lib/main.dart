import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';

int number = 1;

void main() {
  print('${DateTime.now()}: 1');

  Isolate.spawn(isolateFunc, 15);


  sleep(Duration(seconds: 3));
  print('${DateTime.now()}: Sleep end');
}

void isolateFunc(int value) {
  sleep(Duration(seconds: 1));
  print('${DateTime.now()}: isolateFunc end $value');
}

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';

int number = 1;

void main() {
  print('${DateTime.now()}: 1');

  Isolate.spawn(isolateFunc, 1);
  Isolate.spawn(isolateFunc, 2);
  Isolate.spawn(isolateFunc, 3);
  Isolate.spawn(isolateFunc, 4);
  Isolate.spawn(isolateFunc, 5);
  Isolate.spawn(isolateFunc, 6);
  Isolate.spawn(isolateFunc, 7);
  Isolate.spawn(isolateFunc, 8);
  Isolate.spawn(isolateFunc, 9);
  Isolate.spawn(isolateFunc, 10);

  sleep(Duration(seconds: 5));
  print('${DateTime.now()}: Sleep end，number = $number');
}

void isolateFunc(int value) {
  number += 1;
  print('${DateTime.now()}: 第$value个调用， number = $number');
}

import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

int number = 0;

void main() async {
  number = await compute(comFunc, 1);

  print(number);
}

int comFunc(int value) {
  sleep(Duration(seconds: 2));
  return number + value;
}
import 'dart:io';
import 'package:flutter/material.dart';

int number = 1;

void main() {
  Future(() {
    sleep(const Duration(seconds: 1));
    number += 1;
    print("${DateTime.now()}: $number");
    return number;
  }).then((value) {
    sleep(const Duration(seconds: 1));
    value += 1;
    print("${DateTime.now()}: $value");
    return value;
  }).then((value) {
    sleep(const Duration(seconds: 1));
    value += 1;
    print("${DateTime.now()}: $value");
    return value;
  }).then((value) {
    sleep(const Duration(seconds: 1));
    value += 1;
    print("${DateTime.now()}: $value");
    return value;
  });
}

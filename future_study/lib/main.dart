import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

int number = 1;

void main() {
  Future((){
    print('1');
  }).then((value){
    print('2');
    scheduleMicrotask((){
      print('3');
    });
  }).then((value){
    print('4');
  });

  scheduleMicrotask((){
    print('5');
  });

  Future((){
    print('6');
  });

  scheduleMicrotask((){
    print('7');
  });

  print('8');
}

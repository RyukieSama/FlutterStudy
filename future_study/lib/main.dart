import 'package:flutter/material.dart';

int number = 1;

void main() {
  print('${DateTime.now()} start: $number');

  doSomeThing();

  print('${DateTime.now()} end: $number');
}

doSomeThing() async {
  await Future( () {
    for(int i = 0; i < 1000000000; i++) {
      number += 1;
    }
    return number;
  }).then( (value) {
    print('then: ${DateTime.now()}  $value');
  });
  print('doSomeThing结束');
}

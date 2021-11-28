import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';

int number = 1;

void main() async {
  print('${DateTime.now()}: 1');

  // 创建端口
  ReceivePort port = ReceivePort();
  // Isolate
  Isolate iso = await Isolate.spawn(isolateFunc, port.sendPort);
  // 监听数据变化
  port.listen((message) {
    number = message;
    print('${DateTime.now()}: 监听到 number = $number');
    // 关闭端口
    port.close();
    // 销毁 Isolate
    iso.kill();
  });
}

void isolateFunc(SendPort send) {
  sleep(Duration(seconds: 3));
  send.send(15);
}

import 'package:fake_wechat/widgets/home/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
//        primarySwatch: Colors.green,// 导航背景
        splashColor: const Color.fromRGBO(1, 1, 1, 0),
      ),
      title: "FakeWechat",
      home: MyHomePage(),
    );
  }
}

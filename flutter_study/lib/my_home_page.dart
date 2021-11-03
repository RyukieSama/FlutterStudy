import 'package:flutter/material.dart';
import 'package:flutter_study/container/my_container.dart';
import 'package:flutter_study/row_column/my_row_column.dart';
import 'text/my_list_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MyRowColumn(),
        // child: MyContainer(),
//        child: MyTextListWidget(),
      ),
    );
  }
}

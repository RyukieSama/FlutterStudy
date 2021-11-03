import 'package:flutter/material.dart';
import 'package:flutter_study/widget/stack/my_stack.dart';
import 'widget/container/my_container.dart';
import 'widget/row_column/my_row_column.dart';
import 'widget/text/my_list_widget.dart';

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
//        child: MyStack(),
         child: MyRowColumn(),
        // child: MyContainer(),
//        child: MyTextListWidget(),
      ),
    );
  }
}

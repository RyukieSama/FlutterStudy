import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GlobalKeyDemo(),
    );
  }
}

class GlobalKeyDemo extends StatelessWidget {

  final GlobalKey<_GKeyItemState> _gKey = GlobalKey();

  GlobalKeyDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key的作用'),
      ),
      body: Center(
        child: GKeyItem(key: _gKey,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _gKey.currentState?.setState(() {
            _gKey.currentState?.count += 1;
          });
        },
      ),
    );
  }
}


class GKeyItem extends StatefulWidget {
  const GKeyItem({Key? key}) : super(key: key);

  @override
  _GKeyItemState createState() => _GKeyItemState();
}

class _GKeyItemState extends State<GKeyItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$count'),
    );
  }
}


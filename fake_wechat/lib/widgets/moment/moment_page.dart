import 'package:flutter/material.dart';

class MommentPage extends StatefulWidget {
  @override
  _MommentPageState createState() => _MommentPageState();
}

class _MommentPageState extends State<MommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发现'),
      ),
      body: Container(
        color: Colors.brown,
      ),
    );
  }
}


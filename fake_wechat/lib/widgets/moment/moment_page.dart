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
        backgroundColor: Colors.cyan[200],
        title: const Text('发现'),
        elevation: 0.0, // 导航底部阴影
        centerTitle: true, // 为了安卓设置
      ),
      body: Container(
        color: Colors.brown,
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MomentDetailPage extends StatelessWidget {
  final String title;

  MomentDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Text(title),
      ),
    );
  }
}

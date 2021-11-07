import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('微信'),
      ),
      body: Container(
        color: Colors.yellow,
        child: const Image(image: AssetImage('images/公众号.png')),
      ),
    );
  }
}

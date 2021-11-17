import 'package:fake_wechat/configs/ui_const.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIConfig.appBarColor, // 和 primarySwatch 冲突
        title: const Text('联系人'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}


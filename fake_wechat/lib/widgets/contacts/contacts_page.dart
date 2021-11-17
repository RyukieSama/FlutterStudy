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
//        centerTitle: true,// 否则多个 actions 的话会被调整到左边去
        backgroundColor: UIConfig.appBarColor, // 和 primarySwatch 冲突
        title: const Text('通讯录'),
        actions: [
          Container(
            width: 44,
            color: Colors.blue,
            child: const Icon(Icons.print),
          ),
          GestureDetector(
            onTap: (){
              print('添加联系人');
            },
            child: Container(
              width: 44,
              color: Colors.blue,
              child: const Icon(Icons.person_add),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

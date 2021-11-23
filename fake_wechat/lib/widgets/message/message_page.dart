import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  PopupMenuItem _buildPopItem(String title, IconData icon) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 8,),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('微信'),
        actions: [
          PopupMenuButton(
            color: Colors.black,
            // 设置垂直偏移量
            offset: const Offset(0, 60),
            itemBuilder: (context) {
              return [
                _buildPopItem('发起群聊', Icons.chat_bubble),
                _buildPopItem('添加朋友', Icons.person_add),
                _buildPopItem('扫一扫', Icons.qr_code_scanner),
                _buildPopItem('收付款', Icons.check_box),
              ];
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow,
        child: const Image(image: AssetImage('images/公众号.png')),
      ),
    );
  }
}

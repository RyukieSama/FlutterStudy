import 'package:fake_wechat/widgets/message/conversation_data.dart';
import 'package:fake_wechat/widgets/service/service_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'conversation_cell.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  void initState() {
    super.initState();
    _loadConversation().then((value) {
      setState(() {
        _conversations = value;
      });
    }).catchError((error) {
      print(error);
    }).whenComplete(() {
      print('Done');
    }).timeout(Duration(seconds: 10));
  }

  @override
  bool get wantKeepAlive => true;

  List _conversations = [];
  bool _isLoading = false;

  /// 加载会话列表
  Future<List> _loadConversation() async {
    _isLoading = true;
    var response = await http.get(ServiceURL.conversationList);
    _isLoading = false;
    if (response.statusCode == 200) {
      final bodyMap = json.decode(response.body);
      final result = bodyMap['lists'].map((item) {
        return ConversationData.formMap(item);
      }).toList();

      return result;
    } else {
      throw Exception('请求失败：${response.statusCode}');
    }
  }

  PopupMenuItem _buildPopItem(String title, IconData icon) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    return ConversationCell(conversation: _conversations[index]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        child: _isLoading
            ? Center(
                child: Text('Loading'),
              )
            : ListView.builder(
                itemBuilder: _itemForRow,
                itemCount: _conversations.length,
              ),
      ),
    );
  }
}

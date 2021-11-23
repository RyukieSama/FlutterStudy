import 'package:flutter/material.dart';

class ConversationData {
  final String nick;
  final String avatar;
  final String lastestMessage;

  ConversationData({
    required this.nick,
    required this.avatar,
    required this.lastestMessage,
  });

  factory ConversationData.formMap(Map map) {
    return ConversationData(
      nick: map['nick'],
      avatar: map['avatar'],
      lastestMessage: map['lastest_message'],
    );
  }
}

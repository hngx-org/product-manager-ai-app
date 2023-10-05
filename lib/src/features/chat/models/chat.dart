// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'chat.g.dart';

@HiveType(typeId: 2)
class ChatList {
  @HiveField(0)
  final List<Chat> chatList;

  ChatList(this.chatList);

  @override
  String toString() => 'ChatList(chatList: $chatList)';
}

@HiveType(typeId: 3)
class Chat {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final bool isAi;

  @HiveField(2)
  final DateTime time;

  Chat({
    required this.text,
    required this.isAi,
    required this.time,
  });

  @override
  String toString() => 'Chat(text: $text, isAi: $isAi, time: $time)';
}

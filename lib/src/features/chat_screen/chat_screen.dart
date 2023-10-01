import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/core/models/chat_model.dart';
import 'package:product_management_ai_app/src/features/chat_screen/chat_text_field.dart';
import 'package:product_management_ai_app/src/features/chat_screen/components/chat_tile.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(
      text: 'Hello! I am the AI.',
      type: MessageType.ai,
      timestamp: DateTime.now(),
    ),
  ];

  final TextEditingController chatText = TextEditingController();

  void sendChat(String text) {
    final ChatMessage chat = ChatMessage(
      text: text,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
    messages.add(chat);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Chat',
        isBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return ChatTile(
                  message: message,
                  sender: message.type == MessageType.ai ? true : false,
                );
              },
            ),
          ),
          ChatTextField(chatText: chatText, sendChat: sendChat)
        ],
      ),
    );
  }
}

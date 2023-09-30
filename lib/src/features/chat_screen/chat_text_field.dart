import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController chatText;
  final Function sendChat;
  const ChatTextField(
      {super.key, required this.chatText, required this.sendChat});

  final border = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 0.755),
      width: 1.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: const Color.fromRGBO(246, 247, 248, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ]),
      child: TextField(
        controller: chatText,
        decoration: InputDecoration(
          hintText: 'Type your message...',
          hintStyle: const TextStyle(color: Color.fromRGBO(153, 157, 169, 1)),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
              color: Color.fromRGBO(95, 118, 238, 1),
            ),
            onPressed: () {
              final message = chatText.text;
              chatText.clear();
              sendChat(message);
            },
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}

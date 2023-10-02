import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/core/models/chat_model.dart';

class ChatTile extends StatelessWidget {
  final ChatMessage message;
  final bool sender;

  const ChatTile({super.key, required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sender ? Alignment.centerLeft : Alignment.centerRight,
      child: sender
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromRGBO(95, 118, 238, 1),
                  backgroundImage: AssetImage('assets/images/icons8-bot.gif'),
                ),
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 250,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ).copyWith(left: 10),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      message.text,
                      softWrap: true,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          : Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(95, 118, 238, 1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/features/chat/chat_text_field.dart';
import 'package:product_management_ai_app/src/features/chat/components/chat_tile.dart';
import 'package:product_management_ai_app/src/features/chat/controller/chat_controller.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat_model.dart';
import 'package:product_management_ai_app/src/features/upgrade_notification/upgrade_screen.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ChatScreen extends HookWidget {
  final String? userMessage;
  const ChatScreen({this.userMessage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = useState<List<ChatMessage>>([]);
    final chatText = useTextEditingController();
    final isLoading = useState<bool>(true);
    final notSuscribed = useState<bool>(false);
    final userPrompts = useState<List<String>>([]);

    useEffect(() {
      if (userMessage!.isNotEmpty) {
        ChatController().aiReponse(userMessage as String, isLoading, messages,
            context, notSuscribed, userPrompts);
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          messages.value.insert(
            0,
            ChatMessage(
              text: 'Hello! How can I assist you today?',
              type: MessageType.ai,
              timestamp: DateTime.now(),
            ),
          );
          isLoading.value = false;
        });
      }
      return null;
    }, []);

    log('messages.value: ${messages.value}');
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: isLoading.value
                      ? messages.value.length + 1
                      : messages.value.length,
                  padding: EdgeInsets.all(16.w),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == messages.value.length) {
                      // Show loading indicator
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Lottie.asset('loading'.json, height: 40.h),
                      );
                    } else {
                      final message = messages.value.reversed.toList()[index];
                      return ChatTile(
                        message: message,
                        sender: message.type == MessageType.ai ? true : false,
                      );
                    }
                  },
                ),
              ),
              ChatTextField(
                chatText: chatText,
                sendChat: ChatController().sendChat,
                loading: isLoading.value,
                messages: messages,
                chatContext: context,
                isLoading: isLoading,
                notSuscribed: notSuscribed,
                userPrompts: userPrompts,
              )
            ],
          ),
          notSuscribed.value ? const UpgradeScreen() : Container(),
        ],
      ),
    );
  }
}

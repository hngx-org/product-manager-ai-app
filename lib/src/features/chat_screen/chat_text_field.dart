import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController chatText;
  final Function sendChat;
  final bool loading;
  const ChatTextField(
      {super.key,
      required this.chatText,
      required this.sendChat,
      required this.loading});

  final border = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 0.755),
      width: 1.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          hintText: 'Type your message...',
          hintStyle: const TextStyle(color: Color.fromRGBO(153, 157, 169, 1)),
          suffixIcon: !loading
              ? IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    final message = chatText.text;
                    chatText.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                    sendChat(message);
                  },
                )
              : Lottie.asset('text'.json, height: 40.h),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}

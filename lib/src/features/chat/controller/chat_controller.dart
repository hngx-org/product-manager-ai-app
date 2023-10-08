import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hngx_openai/repository/openai_repository.dart';
import 'package:product_management_ai_app/src/core/constants/product_management_keywords.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';
import 'package:product_management_ai_app/src/data/local_service/toast_service.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat_model.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ChatController {
  void sendChat(
    String text,
    ValueNotifier<bool> isLoading,
    ValueNotifier<List<ChatMessage>> messages,
    BuildContext context,
    ValueNotifier<bool> notSuscribed,
    ValueNotifier<List<String>> userPrompts,
  ) async {
    final lowercasedText = text.toLowerCase();
    final List<String> greetings = [
      "hi",
      "hello",
      "hey",
      "hi there",
      "hey there",
    ];

    bool containsProductManagementKeyword = productManagementTerms.any(
      (keyword) => lowercasedText.contains(keyword.toLowerCase()),
    );

    if (containsProductManagementKeyword) {
      aiReponse(text, isLoading, messages, context, notSuscribed, userPrompts);
    } else if (greetings.contains(lowercasedText.trim())) {
      final chat = ChatMessage(
        text: text,
        type: MessageType.user,
        timestamp: DateTime.now(),
      );
      messages.value.insert(0, chat);
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 3), () {
        isLoading.value = false;
        final chat = ChatMessage(
          text: "Hello! How can I assist you today?",
          type: MessageType.ai,
          timestamp: DateTime.now(),
        );
        messages.value.insert(0, chat);
      });
    } else {
      ToastService().showCustomToast(
        "You are not allowed to ask a question outside of the field of product management.",
        isError: true,
      );
    }
  }

  void aiReponse(
    String text,
    ValueNotifier<bool> isLoading,
    ValueNotifier<List<ChatMessage>> messages,
    BuildContext context,
    ValueNotifier<bool> notSuscribed,
    ValueNotifier<List<String>> userPrompts,
  ) async {
    final chat = ChatMessage(
      text: text,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
    isLoading.value = true;
    messages.value.insert(0, chat);
    userPrompts.value.add(text);
    final user = await getIt<HiveService>().getData('user');
    String cookie = user.cookie;
    debugPrint('cookie: $cookie');

    if (userPrompts.value.length <= 1) {
      try {
        OpenAIRepository openAI = OpenAIRepository();

        final aiResponse = await openAI.getChat(text, cookie);

        List<String> parts = aiResponse.split(":");

        String result = parts[1].trim();

        // String filterText(String response) {
        //   if (response.startsWith('M')) {
        //     // If the return String is a Message
        //     // Other definitions can come here
        //     log("This is a Success Text");
        //     return response.substring(8).trim();
        //   } else {
        //     // If the return String is an Error
        //     // Other definitions can come here
        //     log("This is an Error Text");
        //     return response.substring(6).trim();
        //   }
        // }

        print(result);

        if (result == "Subscription Required") {
          notSuscribed.value = true;
        } else if (!aiResponse.startsWith('M')) {
          final chat = ChatMessage(
            text:
                "I am experiencing a high volume of requests. Please try again later.",
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          isLoading.value = false;
          messages.value.insert(0, chat);
        } else {
          debugPrint('result: $result');
          final chat = ChatMessage(
            text: aiResponse.substring(8).trim(),
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          final log = await Hive.openBox<Chat>('aichats');
          log.add(Chat(
            text: aiResponse.substring(8).trim(),
            isAi: true,
            time: DateTime.now(),
          ));

          isLoading.value = false;
          messages.value.insert(0, chat);
        }
      } catch (e) {
        print("error: $e");
      }
    } else {
      print("multiple prompts");
      try {
        OpenAIRepository openAI = OpenAIRepository();

        final aiResponse =
            await openAI.getChatCompletions(userPrompts.value, text, cookie);
        debugPrint('aiResponse: $aiResponse');

        List<String> parts = aiResponse.split(":");

        String result = parts[1].trim();

        if (result == "Subscription Required") {
          notSuscribed.value = true;
        } else if (!aiResponse.startsWith('M')) {
          final chat = ChatMessage(
            text:
                "I am experiencing a high volume of requests. Please try again later.",
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          isLoading.value = false;
          messages.value.insert(0, chat);
        } else {
          debugPrint('result: $result');
          final chat = ChatMessage(
            text: aiResponse.substring(8).trim(),
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );

          final log = await Hive.openBox<Chat>('aichats');
          log.add(Chat(
            text: aiResponse.substring(8).trim(),
            isAi: true,
            time: DateTime.now(),
          ));

          isLoading.value = false;
          messages.value.insert(0, chat);
        }
      } catch (e) {
        print("error: $e");
      }
    }
  }

  void clearLogs() async {
    final logsBox = await Hive.openBox<Chat>('aichats');
    logsBox.clear();
  }

  Future retrieveLogs() async {
    final logsBox = await Hive.openBox<Chat>('aichats');
    final logs = logsBox.values.toList();
    logs.sort((a, b) => a.time.compareTo(b.time));
    return logs;
  }
}

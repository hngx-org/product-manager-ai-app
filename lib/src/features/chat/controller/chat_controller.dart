import 'package:flutter/material.dart';
import 'package:hngx_openai/repository/openai_repository.dart';
import 'package:product_management_ai_app/src/core/constants/product_management_keywords.dart';
import 'package:product_management_ai_app/src/data/local_service/hive_service.dart';
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
    } else if (greetings.contains(lowercasedText)) {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "You are not allowed to ask a question outside of the field of product management."),
          duration: Duration(seconds: 3),
        ),
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

        print(aiResponse);

        List<String> parts = aiResponse.split(":");

        String result = parts[1].trim();

        print(result);

        if (result == "Subscription Required") {
          notSuscribed.value = true;
        } else if (result == "type 'Null' is not a subtype of type 'String'") {
          final chat = ChatMessage(
            text:
                "I am experiencing a high volume of requests. Please try again later.",
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          isLoading.value = false;
          messages.value.insert(0, chat);
        } else {
          final chat = ChatMessage(
            text: result,
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
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

        List<String> parts = aiResponse.split(":");

        String result = parts[1].trim();

        if (result == "Subscription Required") {
          notSuscribed.value = true;
        } else if (result == "type 'Null' is not a subtype of type 'String'") {
          final chat = ChatMessage(
            text:
                "I am experiencing a high volume of requests. Please try again later.",
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          isLoading.value = false;
          messages.value.insert(0, chat);
        } else {
          final chat = ChatMessage(
            text: result,
            type: MessageType.ai,
            timestamp: DateTime.now(),
          );
          isLoading.value = false;
          messages.value.insert(0, chat);
        }
      } catch (e) {
        print("error: $e");
      }
    }

    // Future.delayed(const Duration(seconds: 3), () {
    //   isLoading.value = false;
    // });
  }
}

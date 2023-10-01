import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/core/models/chat_model.dart';
import 'package:product_management_ai_app/src/features/chat_screen/chat_text_field.dart';
import 'package:product_management_ai_app/src/features/chat_screen/components/chat_tile.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = useState<List<ChatMessage>>([]);
    final chatText = useTextEditingController();
    final isLoading = useState<bool>(true);

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        messages.value.insert(
          0,
          ChatMessage(
            text: 'Hello! I am the AI.',
            type: MessageType.ai,
            timestamp: DateTime.now(),
          ),
        );
        isLoading.value = false;
      });
      return null;
    }, []);

    void sendChat(String text) {
      final lowercasedText = text.toLowerCase();

      bool containsProductManagementKeyword = productManagementTerms.any(
        (keyword) => lowercasedText.contains(keyword.toLowerCase()),
      );

      if (containsProductManagementKeyword) {
        final chat = ChatMessage(
          text: text,
          type: MessageType.user,
          timestamp: DateTime.now(),
        );
        isLoading.value = true;
        messages.value.insert(0, chat);
        Future.delayed(const Duration(seconds: 3), () {
          isLoading.value = false;
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

    log('messages.value: ${messages.value}');
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Chat',
        isBackButton: true,
      ),
      body: Column(
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
          ChatTextField(chatText: chatText, sendChat: sendChat)
        ],
      ),
    );
  }
}

List<String> productManagementTerms = [
  "Product",
  "Product Manager (PM)",
  "Roadmap",
  "User Story",
  "MVP (Minimum Viable Product)",
  "Feature",
  "Sprint",
  "Backlog",
  "Stakeholder",
  "Feedback",
  "KPI (Key Performance Indicator)",
  "Market Research",
  "User Persona",
  "Customer Journey",
  "A/B Testing",
  "Product Lifecycle",
  "Agile",
  "Scrum",
  "Product Owner",
  "Customer Development",
  "Lean Product",
  "Product Strategy",
  "Product Development",
  "Product Design",
  "Product Launch",
  "Product Metrics",
  "Product Requirements",
  "User Experience (UX)",
  "User Interface (UI)",
  "Competitor Analysis",
  "Product-Market Fit",
  "Feature Prioritization",
  "Release Management",
  "Product Vision",
  "Product Prototype",
  "Usability Testing",
  "Cross-Functional Team",
  "Product Backlog Grooming",
  "Churn Rate",
  "User Retention",
  "Feature Creep",
  "Beta Testing",
  "Product Enhancement",
  "Customer Segmentation",
  "Product Portfolio",
  "Product Evangelist",
  "Customer Support",
  "Product Scaling",
  "Product Testing",
  "Product Differentiation",
  "Product Innovation",
  "Product Pricing",
  "Product Revenue",
  "Product Marketability",
  "Product Launch Plan",
  "Product Validation",
  "Product Goals",
  "Product User Base",
  "Product Monetization",
  "Product Market Analysis",
  "Product ROI (Return on Investment)",
  "Product Strategy Alignment",
  "Product Maintenance",
  "Product Dependency",
  "Product Integration",
  "Product Feedback Loop",
  "Product Decision-Making",
  "Product Evolution",
  "Product Features Matrix",
  "Product Requirements Document (PRD)",
  "Product Release Cycle",
  "Product Design Sprint",
  "Product Ownership",
  "Product Delivery",
  "Product User Research",
  "Product Analytics",
  "Product Communication",
  "Product Innovation Lab",
  "Product Discovery",
  "Product Planning",
  "Product Roadmap Alignment",
  "Product Market Entry",
  "Product Scaling Strategy",
  "Product Security",
  "Product Prototyping",
  "Product Launch Strategy",
  "Product Launch Checklist",
  "Product User Onboarding",
  "Product User Engagement",
  "Product Usability",
  "Product Decision Framework",
  "Product Risk Management",
  // Add more terms here
];

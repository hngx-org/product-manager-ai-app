import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/features/chat_screen/chat_screen.dart';
import 'package:product_management_ai_app/src/features/chat_screen/drawer/hidden_draw.dart';
import 'package:product_management_ai_app/src/features/home/widgets/prompt.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HiddenDrawer(
                userMessage: "",
                pageIndex: 1,
              ),
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        label: Text(
          'Start a new chat',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: ListView.builder(
        itemCount: productManagementPrompts.length,
        padding: const EdgeInsets.only(top: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return CardWidget(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HiddenDrawer(
                  userMessage: productManagementPrompts[index],
                  pageIndex: 1,
                ),
              ),
            ),
            text: productManagementPrompts[index],
            isLast: index == productManagementPrompts.length - 1,
          );
        },
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String text;
  final bool isLast;
  final VoidCallback onTap;
  const CardWidget({
    super.key,
    required this.text,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: isLast ? 100 : 8,
        ),
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ),
      ),
    );
  }
}

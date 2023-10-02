import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/features/onbaording/onboarding_screen.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    Future(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const OnbaordingScreen(),
      ));
    });

    return const Scaffold();
  }
}

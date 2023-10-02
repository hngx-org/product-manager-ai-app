import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/screens.dart';
import 'package:product_management_ai_app/src/features/onbaording/widgets/widgets.dart';
import 'package:product_management_ai_app/src/shared/utils/extensions.dart';

class OnbaordingScreen extends HookWidget {
  const OnbaordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => FlipCardController(), []);
    final hasToggled = useState(false);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 6), (timer) {
        controller.toggleCard();
      });

      return () {
        timer.cancel();
      };
    }, []);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.w),
            child: FlipCard(
              onFlipDone: (isFront) => hasToggled.value = !hasToggled.value,
              autoFlipDuration: const Duration(seconds: 6),
              controller: controller,
              direction: FlipDirection.VERTICAL,
              side: CardSide.FRONT,
              front: const OnboardCard(
                imagePath: '1',
                isFront: true,
              ),
              back: const OnboardCard(
                imagePath: '2',
                isFront: false,
              ),
            ),
          ),
          hasToggled.value
              ? const DescriptionCard(
                  text:
                      'Welcome to ProdGenius||Unlock the power of AI-driven Product Management. Get ready to streamline your product development process and make data-driven decisions like a pro!',
                )
              : const DescriptionCard(
                  text:
                      'Meet ProdWhiz: Your Product Management Assistant||Introducing ProdWhiz, your trusted AI companion for product management. Navigate the complexities of product development effortlessly and boost your productivity.',
                ),
          OnbaordButton(
            onLoginPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            ),
            onSignUpPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            ),
          ),
        ],
      ).padSymmetric(
        vertical: 30.h,
      ),
    );
  }
}

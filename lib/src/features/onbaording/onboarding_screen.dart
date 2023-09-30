import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/screens.dart';
import 'package:product_management_ai_app/src/features/dashboard/dashboard_screen.dart';
import 'package:product_management_ai_app/src/features/onbaording/widgets/widgets.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class OnbaordingScreen extends HookWidget {
  const OnbaordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => FlipCardController(), []);
    final hasToggled = useState(false);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 6), (timer) {
        controller.toggleCard();
        hasToggled.value = !hasToggled.value;
      });

      return () {
        timer.cancel();
      };
    }, []);
    return Scaffold(
      body: Column(
        children: [
          .05.sh.hi,
          Padding(
            padding: EdgeInsets.all(10.0.w),
            child: FlipCard(
              onFlip: () {
                hasToggled.value = !hasToggled.value;
              },
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
          .1.sh.hi,
          hasToggled.value
              ? const DescriptionCard(
                  text:
                      'Get your PM work done fasters||Duis leo. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Fusce a quam. Nullam sagittis.',
                )
              : const DescriptionCard(
                  text:
                      'Welcome to Luna, your PM AI assistant||Duis leo. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Fusce a quam. Nullam sagittis.',
                ),
          .07.sh.hi,
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
          10.hi,
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
            ),
            child: SizedBox(
              height: 40.h,
              width: .8.sw,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

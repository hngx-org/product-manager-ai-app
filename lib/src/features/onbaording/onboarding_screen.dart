// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_management_ai_app/src/features/authentication/screens/screens.dart';
import 'package:product_management_ai_app/src/features/dashboard/dashboard_screen.dart';
import 'package:product_management_ai_app/src/features/onbaording/widgets/onboard_button.dart';
import 'package:product_management_ai_app/src/features/onbaording/widgets/onboard_card.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class OnbaordingScreen extends StatelessWidget {
  const OnbaordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: AppConstants.kScaffoldGradient,
        child: Column(
          children: [
            .05.sh.hi,
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: const FlipCard(
                autoFlipDuration: Duration(seconds: 3),
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: OnboardCard(
                  imagePath: '1',
                  isFront: true,
                ),
                back: OnboardCard(
                  imagePath: '2',
                  isFront: false,
                ),
              ),
            ),
            .1.sh.hi,
            SizedBox(
              child: Column(
                children: [
                  Text(
                    'Track your daily tasks',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  20.hi,
                  Text(
                    'Duis leo. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Fusce a quam. Nullam sagittis.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ).padHorizontal(25),
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
      ),
    );
  }
}

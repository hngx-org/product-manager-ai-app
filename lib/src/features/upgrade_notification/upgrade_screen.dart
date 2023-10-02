import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:product_management_ai_app/src/core/constants/app_color.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: AppColors.scaffoldBackgroundColor.withOpacity(0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(41, 255, 232, 117),
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 225, 77),
                  width: 0.5,
                ),
              ),
              child: const Icon(
                Iconsax.crown1,
                color: Color.fromARGB(255, 245, 204, 0),
                size: 30,
              ),
            ),
            20.hi,
            const Text(
              textAlign: TextAlign.center,
              "Upgrade to Access the Full Potential of Luna.ai",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            10.hi,
            const Text(
              textAlign: TextAlign.center,
              "Unlock limitless content possibilities. Upgrade now to exceed your credit limit and access valuable content that fuels creativity. Get more credit and unleash your full potential with our paid plans.",
            ),
            20.hi,
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.defaultColor,
                ),
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.white.withOpacity(0.1),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Text(
                  "Upgrade Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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

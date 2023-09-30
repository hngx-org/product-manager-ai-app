import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class OnboardCard extends StatelessWidget {
  final String imagePath;
  final bool isFront;
  const OnboardCard({
    Key? key,
    required this.imagePath,
    required this.isFront,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .4.sh,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          begin: isFront
              ? const Alignment(0.72, -0.69)
              : const Alignment(-0.72, -0.69),
          end: isFront
              ? const Alignment(-0.72, 0.69)
              : const Alignment(0.72, 0.69),
          colors: const [Color(0xFF008FD5), Color(0xFF020066)],
        ),
      ),
      child: Image.asset(
        'assets/images/onboard$imagePath.png',
        fit: BoxFit.cover,
      ).padAll(20),
    );
  }
}

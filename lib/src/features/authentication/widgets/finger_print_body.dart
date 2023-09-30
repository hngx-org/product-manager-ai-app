import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class FingerPrintBody extends StatelessWidget {
  const FingerPrintBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.hi,
        SvgPicture.asset(
          'fingerprint'.svg,
          height: 70.r,
          width: 70.r,
          // ignore: deprecated_member_use
          color: AppColors.textColor,
        ),
        Text(
          'Please hold your finger at the fingerprint scanner to verify your identity.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ).padOnly(
          top: 20.h,
          bottom: 16.h,
          left: 20.w,
          right: 20.w,
        ),
        CustomElevatedButton(
          text: 'Use password instead',
          onPressed: () => Navigator.pop(context),
          height: 60,
          hasBorderRadius: false,
        ),
      ],
    );
  }
}

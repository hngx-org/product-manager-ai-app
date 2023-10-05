// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final int elevation;
  final int height;
  final ButtonWidth size;
  final bool hasBorderRadius;
  final bool isLoading;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.buttonColor,
    this.textColor,
    required this.onPressed,
    this.elevation = 0,
    this.height = 50,
    this.size = ButtonWidth.large,
    this.hasBorderRadius = true,
    this.isLoading = false,
  }) : super(key: key);

  buttonWidth(ButtonWidth size) {
    switch (size) {
      case ButtonWidth.small:
        return .3.sw;
      case ButtonWidth.medium:
        return .5.sw;
      case ButtonWidth.large:
      default:
        return double.infinity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      width: buttonWidth(size),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation.toDouble(),
          backgroundColor: textColor ?? AppColors.primaryColor,
          foregroundColor: buttonColor ?? Colors.white,
          textStyle: Theme.of(context).textTheme.bodyLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              hasBorderRadius ? 8.r : 0,
            ),
          ),
        ),
        child: isLoading
            ? Lottie.asset(
                'button-loader'.json,
                height: 40.h,
              )
            : Text(
                text,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class CustomTextField extends HookWidget {
  final TextEditingController controller;
  final String hintText;
  final Duration obscureTimerDuration;
  final bool textObscured;
  final String? Function(String?)? validator;
  final Color? filledColor;
  final bool? num;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.filledColor,
    this.num = false,
    this.textObscured = false,
    this.obscureTimerDuration = const Duration(seconds: 3),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isObscure = useState<bool>(textObscured);

    return TextFormField(
      controller: controller,
      obscureText: isObscure.value,
      keyboardType: num == true ? TextInputType.number : TextInputType.text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.greyTextColor,
            ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.secondaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        fillColor: filledColor ?? Colors.white,
        hintText: hintText,
        suffixIcon: textObscured
            ? IconButton(
                icon: isObscure.value
                    ? SvgPicture.asset(
                        'eye-open'.svg,
                      )
                    : SvgPicture.asset(
                        'eye-closed'.svg,
                      ),
                onPressed: () => isObscure.value = !isObscure.value,
              )
            : null,
      ),
    );
  }
}

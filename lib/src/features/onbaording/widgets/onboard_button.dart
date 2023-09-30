// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbaordButton extends StatelessWidget {
  final VoidCallback? onLoginPressed;
  final VoidCallback? onSignUpPressed;

  const OnbaordButton({
    Key? key,
    this.onLoginPressed,
    this.onSignUpPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .8.sw,
      height: 40.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2.0,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onLoginPressed,
              child: Container(
                height: 40.h,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.50,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x26A6A6A6),
                      blurRadius: 40,
                      offset: Offset(50, 10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onSignUpPressed,
              child: Container(
                height: 40.h,
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

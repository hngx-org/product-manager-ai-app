import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

bottomSheet(
  BuildContext context, {
  required Widget child,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) {
      return Container(
        color: AppColors.scaffoldBackgroundColor,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              6.hi,
              Container(
                height: 5.h,
                width: .12.sw,
                decoration: BoxDecoration(
                  color: AppColors.greyTextColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
              ),
              6.hi,
              child,
            ],
          ),
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

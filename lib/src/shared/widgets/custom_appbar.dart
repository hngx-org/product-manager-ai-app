import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_management_ai_app/src/core/core.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

//later refactor this to use the normal appbar
PreferredSize customAppBar(
  BuildContext context, {
  String title = "",
  Widget? content,
  VoidCallback? onActionTap,
  bool isBackButton = false,
  bool hasElevation = true,
  Widget leading = const SizedBox.shrink(),
  VoidCallback? onLeadingTap,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(45.h),
    child: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          boxShadow: !hasElevation
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        height: 58.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                isBackButton
                    ? InkWell(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          "arrow-back".svg,
                          // width: 50,
                          fit: BoxFit.cover,
                        ).padSymmetric(
                          horizontal: 16.w,
                          vertical: 15.h,
                        ),
                      ).padOnly(
                        right: 8.w,
                      )
                    : InkWell(
                        onTap: onLeadingTap ?? () {},
                        child: leading,
                      )
                        .padSymmetric(
                          horizontal: 16.w,
                          vertical: 15.h,
                        )
                        .padOnly(
                          right: 8.w,
                        ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            if (onActionTap != null)
              const Row(
                children: [],
              ),
          ],
        ),
      ),
    ),
  );
}

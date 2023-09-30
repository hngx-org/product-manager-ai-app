import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/core/constants/app_color.dart';

class AppConstants {
  static BoxDecoration kScaffoldGradient = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment.topLeft,
      focalRadius: 1.5,
      colors: [
        const Color.fromARGB(255, 112, 167, 195).withOpacity(.1).withAlpha(100),
        const Color.fromARGB(255, 138, 169, 185).withOpacity(.1).withAlpha(100),
        AppColors.scaffoldBackgroundColor,
      ],
      radius: 1.3,
    ),
  );
}

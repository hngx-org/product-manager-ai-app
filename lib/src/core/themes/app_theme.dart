import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class AppTheme with ChangeNotifier {
  static const _poppins = 'Poppins';

  static TextTheme _buildPoppinsTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 96.0.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
      displayMedium: TextStyle(
        fontSize: 48.0.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 34.0.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
      labelSmall: TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    ).apply(
      fontFamily: _poppins,
    );
  }

  static ThemeData light({required bool material3}) {
    return ThemeData.light().copyWith(
      useMaterial3: material3,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      cardTheme: const CardTheme(
        color: AppColors.scaffoldBackgroundColor,
      ),
      textTheme: _buildPoppinsTextTheme(),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
    );
  }
}

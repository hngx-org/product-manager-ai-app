import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on Widget {
  /// Adds padding to the widget with all sides having the same padding value.
  Widget padAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding.h),
      child: this, // 'this' refers to the current widget.
    );
  }

  /// Adds horizontal padding to the widget.
  Widget padHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  Widget padVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding.h),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  Widget padSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vertical.h, horizontal: horizontal.w),
      child: this,
    );
  }

  /// Adds left padding to the widget.
  Widget padLeft(double padding) {
    return Padding(
      padding: EdgeInsets.only(left: padding.w),
      child: this,
    );
  }

  /// Adds right padding to the widget.
  Widget padRight(double padding) {
    return Padding(
      padding: EdgeInsets.only(right: padding.w),
      child: this,
    );
  }

  /// Adds top padding to the widget.
  Widget padTop(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding.h),
      child: this,
    );
  }

  /// Adds bottom padding to the widget.
  Widget padBottom(double padding) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding.h),
      child: this,
    );
  }

  Widget padOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left?.w ?? 0,
        right: right?.w ?? 0,
        top: top?.h ?? 0,
        bottom: bottom?.h ?? 0,
      ),
      child: this,
    );
  }
}

extension CustomSizedBox on num {
  /// Creates a SizedBox with the width set to the value.
  SizedBox get wi {
    return SizedBox(
      width: toDouble().w,
    );
  }

  /// Creates a SizedBox with the height set to the value.
  SizedBox get hi {
    return SizedBox(
      height: toDouble().h,
    );
  }

  /// Creates a SizedBox with both width and height set to the value.
  SizedBox get wh {
    return SizedBox(
      width: toDouble().w,
      height: toDouble().h,
    );
  }

  /// Creates a SizedBox with the specified width and height.
  SizedBox size({required double width, required double height}) {
    return SizedBox(
      width: width.toDouble().w,
      height: height.toDouble().h,
    );
  }
}

extension FilePaths on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
  String get gif => 'assets/images/$this.gif';
  String get json => 'assets/lotties/$this.json';
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class ToastService {
  void showToast(String message, {bool isError = false}) {
    _showToast(message, isError);
  }

  void _showToast(String message, bool isError) {
    showToastWidget(
      _buildToastContainer(
        message,
        isError,
      ),
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 5),
      handleTouch: true,
      animationCurve: Curves.elasticIn,
    );
  }

  Widget _buildToastContainer(String message, bool isError) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          padding: const EdgeInsets.symmetric(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
            gradient: LinearGradient(
              colors: isError
                  ? [
                      Colors.red.withAlpha(80),
                      Colors.red.withAlpha(60),
                      Colors.red.withAlpha(55),
                    ]
                  : [
                      Colors.greenAccent.withAlpha(80),
                      Colors.greenAccent.withAlpha(60),
                      Colors.greenAccent.withAlpha(55),
                    ],
              stops: const [0.0, 0.4, 0.8],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            child: Text(
              message,
            ),
          ),
        ),
      ],
    );
  }
}

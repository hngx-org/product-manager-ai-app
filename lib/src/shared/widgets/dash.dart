import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final double length;
  final bool isHorizontal;
  final double dashWidth;
  final double dashHeight; // Added property
  final double dashSpacing;
  final Color color;
  final double borderRadius;

  DashedLinePainter({
    required this.length,
    required this.isHorizontal,
    this.dashWidth = 5,
    this.dashHeight = 1, // Default height for horizontal dashed line
    this.dashSpacing = 5,
    this.color = Colors.black,
    this.borderRadius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double numDashes = length / (dashWidth + dashSpacing);

    for (int i = 0; i < numDashes; i++) {
      final double start = i * (dashWidth + dashSpacing);
      final double end = start + dashWidth;

      final paint = Paint()
        ..color = color
        ..strokeWidth = dashHeight; // Use dashHeight as stroke width

      if (isHorizontal) {
        canvas.drawLine(Offset(start, 0), Offset(end, 0), paint);
      } else {
        canvas.drawLine(Offset(0, start), Offset(0, end), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // The painting doesn't change
  }
}

class DashedLineWithOverlay extends StatelessWidget {
  final double length;
  final bool isHorizontal;
  final Widget overlay;
  final double dashWidth;
  final double dashHeight; // Added property
  final double dashSpacing;
  final Color color;
  final double borderRadius;

  const DashedLineWithOverlay({
    Key? key,
    required this.length,
    required this.isHorizontal,
    required this.overlay,
    this.dashWidth = 5,
    this.dashHeight = 1, // Default height for horizontal dashed line
    this.dashSpacing = 5,
    this.color = Colors.black,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: DashedLinePainter(
            length: length,
            isHorizontal: isHorizontal,
            dashWidth: dashWidth,
            dashHeight: dashHeight, // Pass the dashHeight property
            dashSpacing: dashSpacing,
            color: color,
            borderRadius: borderRadius,
          ),
          size: isHorizontal
              ? Size(length, dashHeight)
              : Size(dashHeight, length),
        ),
        overlay,
      ],
    );
  }
}

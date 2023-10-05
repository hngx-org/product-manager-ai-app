import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final bool isLast;
  final VoidCallback onTap;
  const CardWidget({
    super.key,
    required this.text,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: isLast ? 100 : 8,
        ),
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:product_management_ai_app/src/shared/shared.dart';

class DescriptionCard extends StatelessWidget {
  final String text;
  const DescriptionCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            text.split('||')[0],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          20.hi,
          Text(
            text.split('||')[1],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    ).padHorizontal(25);
  }
}

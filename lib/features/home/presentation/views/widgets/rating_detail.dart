import 'package:bookly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class RatingDetail extends StatelessWidget {
  const RatingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 24.0),
        SizedBox(width: 4.0),
        Text("4.8", style: AppStyles.textStyleSemibold14),
        SizedBox(width: 4.0),
        Text("(200)", style: AppStyles.textStyleSemibold14),
      ],
    );
  }
}

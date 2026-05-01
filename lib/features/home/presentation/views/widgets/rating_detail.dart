import 'package:bookly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class RatingDetail extends StatelessWidget {
  const RatingDetail({super.key, this.rating, this.reviewsCount});
  final String? rating, reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 24.0),
        const SizedBox(width: 4.0),
        Text(rating ?? "0.0", style: AppStyles.textStyleSemibold14),
        const SizedBox(width: 4.0),
        Text("(${reviewsCount ?? "0"})", style: AppStyles.textStyleSemibold14),
      ],
    );
  }
}

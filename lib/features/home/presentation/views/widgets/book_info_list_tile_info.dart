import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_detail.dart';
import 'package:flutter/material.dart';

class BookInfoListTileInfo extends StatelessWidget {
  const BookInfoListTileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "The Psychology of Money",
          style: AppStyles.textStyleSemiBold20,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6.0),
        Text(
          "Morgan Housel",
          style: AppStyles.textStyleRegular14.copyWith(color: Colors.white54),
        ),
        const SizedBox(height: 6.0),
        const Row(
          children: [
            Text("1999 \$", style: AppStyles.textStyleSemiBold20),
            Spacer(),
            RatingDetail(),
          ],
        ),
      ],
    );
  }
}

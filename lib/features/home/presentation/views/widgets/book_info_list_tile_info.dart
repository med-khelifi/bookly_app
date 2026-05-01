import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_detail.dart';
import 'package:flutter/material.dart';

class BookInfoListTileInfo extends StatelessWidget {
  const BookInfoListTileInfo({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    this.rating,
    this.ratingCount,
  });
  final String title, author, price;
  final String? rating, ratingCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.textStyleSemiBold20,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6.0),
        Text(
          author,
          style: AppStyles.textStyleRegular14.copyWith(color: Colors.white54),
        ),
        const SizedBox(height: 6.0),
        Row(
          children: [
            Text("$price \$", style: AppStyles.textStyleSemiBold20),
            const Spacer(),
            RatingDetail(rating: rating, reviewsCount: ratingCount),
          ],
        ),
      ],
    );
  }
}

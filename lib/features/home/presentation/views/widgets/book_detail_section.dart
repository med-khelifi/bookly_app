import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_view_book_preview.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_detail.dart';
import 'package:flutter/material.dart';

class BookDetailSection extends StatelessWidget {
  const BookDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeaturedBookCard(imageUrl: "https://books.google.com/books/content?id=ZtqzDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
        SizedBox(height: 40),
        Text('The Jungle Book', style: AppStyles.textStyleRegular30),
        SizedBox(height: 4),
        Text('Rudyard Kipling', style: AppStyles.textStyleRegular18),
        SizedBox(height: 14),
        RatingDetail(),
        SizedBox(height: 37),
        BookDetailViewBookPreview(),
      ],
    );
  }
}

import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_view_book_preview.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:bookly/features/home/presentation/views/widgets/rating_detail.dart';
import 'package:flutter/material.dart';

class BookDetailSection extends StatelessWidget {
  const BookDetailSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeaturedBookCard(imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? ''),
        const SizedBox(height: 40),
        Text(book.volumeInfo.title ?? 'No Title', style: AppStyles.textStyleRegular30),
        const SizedBox(height: 4),
        Text(book.volumeInfo.authors?.first ?? 'Unknown Author', style: AppStyles.textStyleRegular18),
        const SizedBox(height: 14),
        RatingDetail(reviewsCount: book.volumeInfo.ratingsCount?.toString() ?? '0', rating: book.volumeInfo.averageRating?.toString() ?? '0.0'),
        const SizedBox(height: 37),
        const BookDetailViewBookPreview(),
      ],
    );
  }
}

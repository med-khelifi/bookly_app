import 'package:bookly/core/router/app_router.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookInfoListTile extends StatelessWidget {
  const BookInfoListTile({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailView, extra: book);
      },
      child: Row(
        children: [
          BookInfoListTileImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
          const SizedBox(width: 30.0),
          Expanded(
            child: BookInfoListTileInfo(
              author: book.volumeInfo.authors?.first ?? 'Unknown Author',
              title: book.volumeInfo.title ?? 'Unknown Title',
              price: 'free',
              rating: book.volumeInfo.averageRating?.toString() ?? '0.0',
              ratingCount: book.volumeInfo.ratingsCount?.toString() ?? '0',
            ),
          ),
        ],
      ),
    );
  }
}

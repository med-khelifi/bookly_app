import 'package:bookly/core/router/app_router.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookInfoListTile extends StatelessWidget {
  const BookInfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailView);
      },
      child: const Row(
        children: [
          BookInfoListTileImage(),
          SizedBox(width: 30.0),
          Expanded(child: BookInfoListTileInfo()),
        ],
      ),
      
    );
  }
}

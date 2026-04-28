import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_info.dart';
import 'package:flutter/material.dart';

class BookInfoListTile extends StatelessWidget {
  const BookInfoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BookInfoListTileImage(),
        SizedBox(width: 30.0),
        Expanded(child: BookInfoListTileInfo()),
      ],
    );
  }
}

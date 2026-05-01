import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: AppStyles.textStyleRegular18,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const BookInfoListTileImage(
              imageUrl: 'https://picsum.photos/200/300',
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

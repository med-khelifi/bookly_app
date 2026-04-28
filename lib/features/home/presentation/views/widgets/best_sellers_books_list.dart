import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile.dart';
import 'package:flutter/material.dart';

class BestSellersBooksList extends StatelessWidget {
  const BestSellersBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) => const BookInfoListTile(),
      separatorBuilder: (context, index) => const SizedBox(height: 20.0),
    );
  }
}

import 'package:bookly/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:flutter/material.dart';

class HomeViewFeaturedBooksList extends StatelessWidget {
  const HomeViewFeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const FeaturedBookCard(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}

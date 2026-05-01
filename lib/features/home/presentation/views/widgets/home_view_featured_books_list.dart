import 'package:bookly/core/widgets/cached_image_widgets.dart';
import 'package:bookly/features/home/presentation/bloc/featured_books/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewFeaturedBooksList extends StatelessWidget {
  const HomeViewFeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          var books = state.books;
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FeaturedBookCard(
                imageUrl: books[index].volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          );
        } else if (state is FeaturedBookError) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: Center(child: AppCachedImage(imageUrl: state.errorMessage)),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }

        // return SizedBox(
        //   height: MediaQuery.sizeOf(context).height * 0.35,
        //   child: ListView.separated(
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     itemCount: 10,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) => const FeaturedBookCard(),
        //     separatorBuilder: (context, index) => const SizedBox(width: 10),
        //   ),
        // );
      },
    );
  }
}

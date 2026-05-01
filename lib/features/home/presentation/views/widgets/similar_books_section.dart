import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_cubit.dart';
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocBuilder<RelevantBooksCubit, RelevantBooksState>(
          builder: (context, state) {
            if (state is RelevantBooksSuccess) {
              return SizedBox(
                height: 110,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>  BookInfoListTileImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: state.books.length,
                ),
              );
            } else if (state is RelevantBooksFailure) {
              return Center(child: ErrorWidget(state.errorMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}

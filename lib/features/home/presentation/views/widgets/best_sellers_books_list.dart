import 'package:bookly/core/widgets/error_widget.dart';
import 'package:bookly/features/home/presentation/bloc/newset_books/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_info_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellersBooksList extends StatelessWidget {
  const BestSellersBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 8.0,
            ),
            sliver: SliverList.separated(
              itemCount: state.books.length,
              itemBuilder: (context, index) =>
                  BookInfoListTile(book: state.books[index]),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 20.0),
            ),
          );
        } else if (state is NewestBooksError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(errorMessage: state.errorMessage),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
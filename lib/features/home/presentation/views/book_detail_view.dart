// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_view_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({super.key, required this.book});
  final BookModel book;

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}


class _BookDetailViewState extends State<BookDetailView> {

  @override
  void initState() {
    super.initState();
      // Fetch relevant books based on the category of the current book
      BlocProvider.of<RelevantBooksCubit>(context).fetchRelevantBooks(
        category: widget.book.volumeInfo.categories?.first ?? '',
      );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BookDetailViewAppBar(),
            const SizedBox(height: 30),
            BookDetailSection(book: widget.book),
            const SizedBox(height: 50),
            const SimilarBooksSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

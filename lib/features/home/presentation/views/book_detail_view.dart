import 'package:bookly/features/home/presentation/views/widgets/book_detail_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_detail_view_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailView extends StatelessWidget {
  const BookDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookDetailViewAppBar(),
            SizedBox(height: 30),
            BookDetailSection(),
            SizedBox(height: 50),
            SimilarBooksSection(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/Home_view_featured_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeViewAppBar(),
          HomeViewFeaturedBooksList(),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 16.0, bottom: 8.0),
            child: Text("Best Sellers", style: AppStyles.textStyleSemiBold18),
          ),
        ],
      ),
    );
  }
}

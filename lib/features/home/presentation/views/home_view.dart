import 'package:bookly/core/constants/app_styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_sellers_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_featured_books_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverToBoxAdapter(child: HomeViewAppBar()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: HomeViewFeaturedBooksList()),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("Best Sellers", style: AppStyles.textStyleSemiBold18),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverPadding(
            padding: EdgeInsetsGeometry.only(
              left: 15.0,
              right: 15.0,
              bottom: 16.0,
              top: 8.0,
            ),
            sliver: BestSellersBooksList(),
          ),
        ],
      ),
    );
  }
}

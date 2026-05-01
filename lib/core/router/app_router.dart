import 'package:bookly/core/di/get_it.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_data.dart';
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_detail_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String homeView = '/home';
  static const String bookDetailView = '/book-detail';
  static const String searchView = '/search';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashView(),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionDuration: const Duration(milliseconds: 900),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: bookDetailView,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) =>
              RelevantBooksCubit(homeRepoData: getIt<HomeRepoData>()),
          child: BookDetailView(book: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchView(),
      ),
    ],
  );
}

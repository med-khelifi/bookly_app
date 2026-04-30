import 'package:bookly/core/constants/app_colors.dart';
import 'package:bookly/core/router/app_router.dart';
import 'package:bookly/features/home/presentation/bloc/featured_books/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/bloc/newset_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBookCubit()),
        BlocProvider(create: (context) => NewestBooksCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.primary,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        title: 'Bookly',
        routerConfig: AppRouter.router,
      ),
    );
  }
}

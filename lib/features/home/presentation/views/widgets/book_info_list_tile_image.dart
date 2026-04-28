import 'package:bookly/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class BookInfoListTileImage extends StatelessWidget {
  const BookInfoListTileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.17,
      child: AspectRatio(
        aspectRatio: 0.6666,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(AppAssets.imagesTest1, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

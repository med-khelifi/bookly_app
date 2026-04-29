import 'package:bookly/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class FeaturedBookCard extends StatelessWidget {
  const FeaturedBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: AspectRatio(
        aspectRatio: 0.733,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage(AppAssets.imagesTest),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

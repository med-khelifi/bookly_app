import 'package:bookly/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.imagesLogo),
        const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

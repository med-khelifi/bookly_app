import 'package:flutter/material.dart';

class SlidingSplashText extends StatelessWidget {
  const SlidingSplashText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingAnimation,
      child: const Text('Read Free Books', textAlign: TextAlign.center),
    );
  }
}

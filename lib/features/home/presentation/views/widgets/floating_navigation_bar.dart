import 'dart:ui';

import 'package:flutter/material.dart';

class FloatingNavigationBar extends StatelessWidget {
  const FloatingNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.book, color: Colors.white),
            SizedBox(width: 20),
            Icon(Icons.bookmark, color: Colors.white),
            SizedBox(width: 20),
            Icon(Icons.settings, color: Colors.white),
            SizedBox(width: 20),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/105328380?v=4",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

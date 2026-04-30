// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/core/widgets/cached_image_widgets.dart';
import 'package:flutter/material.dart';

class FeaturedBookCard extends StatelessWidget {
  const FeaturedBookCard({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
        @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      child: AspectRatio(
        aspectRatio: 0.733,
        child: AppCachedImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

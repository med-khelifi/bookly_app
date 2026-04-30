// lib/widgets/cached_image_widgets.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// ─────────────────────────────────────────
/// 1. Basic Cached Image with placeholder & error
/// ─────────────────────────────────────────
class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          placeholder ??
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          errorWidget ??
          const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
}

/// ─────────────────────────────────────────
/// 2. Circular / Avatar Cached Image
/// ─────────────────────────────────────────
class CachedAvatarImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Color backgroundColor;

  const CachedAvatarImage({
    super.key,
    required this.imageUrl,
    this.radius = 30,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              Icon(Icons.person, size: radius, color: Colors.white),
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────
/// 3. Rounded / Card Cached Image
/// ─────────────────────────────────────────
class CachedRoundedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const CachedRoundedImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 12,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(Icons.image_not_supported, color: Colors.grey),
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────
/// 4. Full-Width Banner / Hero Cached Image
/// ─────────────────────────────────────────
class CachedBannerImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final Widget? overlay; // optional gradient overlay

  const CachedBannerImage({
    super.key,
    required this.imageUrl,
    this.height = 200,
    this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade200,
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
            ),
          ),
          if (overlay != null) overlay!,
        ],
      ),
    );
  }
}

/// ─────────────────────────────────────────
/// 5. Fade-in Cached Image (smooth loading)
/// ─────────────────────────────────────────
class CachedFadeImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Duration fadeInDuration;

  const CachedFadeImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.fadeInDuration = const Duration(milliseconds: 400),
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: fadeInDuration,
      // Skeleton shimmer placeholder
      placeholder: (context, url) => _ShimmerBox(width: width, height: height),
      errorWidget: (context, url, error) =>
          const Icon(Icons.broken_image, color: Colors.grey),
    );
  }
}

/// Shimmer-like placeholder box
class _ShimmerBox extends StatefulWidget {
  final double? width;
  final double? height;
  const _ShimmerBox({this.width, this.height});

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween(begin: 0.4, end: 1.0).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey.shade300,
      ),
    );
  }
}
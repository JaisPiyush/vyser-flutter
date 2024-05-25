import 'package:flutter/material.dart';

class ShimmeringImageWidget extends StatelessWidget {
  final String imageUrl;

  const ShimmeringImageWidget({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double imageWidth = constraints.maxWidth;
        final double imageHeight = constraints.maxHeight;

        return Image.network(
          imageUrl,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return child;
          },
        );
      },
    );
  }
}

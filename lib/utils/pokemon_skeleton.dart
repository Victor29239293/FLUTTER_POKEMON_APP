import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemCardSkeleton extends StatelessWidget {
  const ItemCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 16 * 2;
    const cardHeight = 200.0;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: cardHeight,
        width: cardWidth,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 16,
              top: 50,
              child: Container(
                width: cardHeight * 0.45,
                height: cardHeight * 0.45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              left: 16,
              top: 30,
              child: Container(
                width: cardWidth * 0.5,
                height: 20,
                color: Colors.grey.shade400,
              ),
            ),
            Positioned(
              left: 16,
              top: 60,
              child: Container(
                width: cardWidth * 0.3,
                height: 15,
                color: Colors.grey.shade400,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 30,
              child: Container(
                width: cardWidth * 0.4,
                height: 15,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

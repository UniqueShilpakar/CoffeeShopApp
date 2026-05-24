import 'package:coffee_shpo/core/constatnts/app_colors.dart';
import 'package:flutter/material.dart';


class StarRating extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.reviewCount = 0,
    this.size = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: const Color(0xFFFFC107), size: size),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: size - 1,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        if (reviewCount > 0) ...[
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: size - 2,
              color: AppColors.textLight,
            ),
          ),
        ],
      ],
    );
  }
}
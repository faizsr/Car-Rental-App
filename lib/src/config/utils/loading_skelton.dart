import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    this.color,
  });

  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.lGray.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

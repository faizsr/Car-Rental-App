import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextstyles {
  static const TextStyle lg500 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle md500 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.lDarkPurple,
  );

  static TextStyle md600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.lDarkPurple,
  );

  static const TextStyle sm600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle sm500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smSecondary500 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.lGray,
  );

  static TextStyle exSm600 = TextStyle(
    color: AppColors.lBlack,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static TextStyle exSmSecondary400 = TextStyle(
    fontSize: 13,
    color: AppColors.lGray,
  );

  static TextStyle exSmTeritiary600 = TextStyle(
    color: AppColors.lWhite,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}

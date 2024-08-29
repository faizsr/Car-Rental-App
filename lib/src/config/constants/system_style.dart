import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/services.dart';

systemStyle() => SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.lTan,
        systemNavigationBarColor: AppColors.lTan,
      ),
    );

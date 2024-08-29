import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/config/constants/system_style.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/cars_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemStyle();
    return MaterialApp(
      title: 'Car Rentel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: montserrat,
        scaffoldBackgroundColor: AppColors.lTan,
      ),
      home: const CarsListPage(),
    );
  }
}

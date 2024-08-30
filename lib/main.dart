import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/config/constants/system_style.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/car_detailed_page.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/cars_list_page.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/post_new_rental_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemStyle();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Car Rentel App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: montserrat,
          scaffoldBackgroundColor: AppColors.lTan,
        ),
        routes: {
          '/new-rental': (context) => const PostNewRentalPage(),
          '/car-detailed': (context) => const CarDetailedPage(),
        },
        home: const CarsListPage(),
      ),
    );
  }
}

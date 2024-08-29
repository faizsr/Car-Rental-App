import 'package:car_rental_app/src/feature/product/presentation/views/cars_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Car Rentel App',
      home: CarsListPage(),
    );
  }
}

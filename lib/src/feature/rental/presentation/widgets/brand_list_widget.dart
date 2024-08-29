import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BrandListWidget extends StatefulWidget {
  const BrandListWidget({
    super.key,
  });

  @override
  State<BrandListWidget> createState() => _BrandListWidgetState();
}

class _BrandListWidgetState extends State<BrandListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? AppColors.lBlack
                    : AppColors.lWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  brands[index],
                  style: TextStyle(
                    color: index == selectedIndex
                        ? AppColors.lWhite
                        : AppColors.lBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> brands = [
  'ALL',
  'BMW',
  'PORSCHE',
  'AUDI',
  'SKODA',
  'MERCEDEZ',
  'SUZUKI',
  'LAMBORGHINI',
  'MAHINDRA',
  'TESLA',
  'TATA',
  'VOLKSWAGEN',
  'ASTON MARTIN'
];

import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/utils/loading_skelton.dart';
import 'package:flutter/material.dart';

class CarCardLoading extends StatelessWidget {
  const CarCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.lGray.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          const Skelton(width: 150, height: 20),
          const SizedBox(height: 8),
          const Skelton(width: 50),
          Divider(
            height: 30,
            color: AppColors.lGray.withOpacity(0.1),
          ),
          Row(
            children: [
              infoWidget('Fuel Type', 'Petrol'),
              const SizedBox(width: 30),
              infoWidget('Transmission', 'Manual'),
              const Spacer(),
              const Skelton(width: 50, height: 20),
              Text(
                ' / Day',
                style: AppTextstyles.smSecondary500,
              ),
            ],
          )
        ],
      ),
    );
  }

  Column infoWidget(text1, text2) {
    return Column(
      children: [
        Text(text1, style: AppTextstyles.exSmSecondary400),
        const SizedBox(height: 4),
        const Skelton(width: 50),
      ],
    );
  }
}

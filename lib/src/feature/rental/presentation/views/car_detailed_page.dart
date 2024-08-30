import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/bottom_book_now_widget.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/carousel_image_container.dart';
import 'package:flutter/material.dart';

class CarDetailedPage extends StatelessWidget {
  const CarDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalItem =
        ModalRoute.of(context)!.settings.arguments as RentalItemEntity;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            CourselImageContainer(rentalItem: rentalItem),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: size.width,
                color: AppColors.lWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${rentalItem.brand} ${rentalItem.carName}',
                      style: AppTextstyles.lg500,
                    ),
                    Text(
                      rentalItem.year,
                      style: AppTextstyles.smSecondary500,
                    ),
                    const SizedBox(height: 35),
                    availableColorWidget(rentalItem),
                    const SizedBox(height: 35),
                    const Text(
                      'Technical Specifications',
                      style: AppTextstyles.sm600,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        specCard('Fuel Type', rentalItem.fuel),
                        const SizedBox(width: 20),
                        specCard('Transmission', rentalItem.transmission),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBookNowWidget(rentalItem: rentalItem),
      ),
    );
  }

  Expanded specCard(String heading, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lGray.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: AppTextstyles.smSecondary500,
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: AppTextstyles.sm600,
            ),
          ],
        ),
      ),
    );
  }

  Container availableColorWidget(RentalItemEntity rentalItem) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lGray.withOpacity(0.05),
      ),
      child: Row(
        children: [
          const Text(
            'Available Color',
            style: AppTextstyles.sm600,
          ),
          const Spacer(),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.lGray.withOpacity(0.2),
              ),
              color: rentalItem.color.hexToColor(),
            ),
          )
        ],
      ),
    );
  }
}

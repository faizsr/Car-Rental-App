import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.rentalItem});

  final RentalItemEntity rentalItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/car-detailed',arguments: rentalItem),
      child: Container(
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
              child: Image.network(
                rentalItem.imageUrls[0],
                loadingBuilder: (context, child, loadingProgress) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: child,
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text('${rentalItem.brand} ${rentalItem.carName}',
                style: AppTextstyles.md600),
            Text(rentalItem.year, style: AppTextstyles.smSecondary500),
            Divider(
              height: 30,
              color: AppColors.lGray.withOpacity(0.1),
            ),
            Row(
              children: [
                infoWidget('Fuel Type', rentalItem.fuel),
                const SizedBox(width: 30),
                infoWidget('Transmission', rentalItem.transmission),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: montserrat),
                    children: [
                      TextSpan(
                        text: '₹${rentalItem.price}',
                        style: AppTextstyles.md600,
                      ),
                      TextSpan(
                        text: ' / Day',
                        style: AppTextstyles.smSecondary500,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column infoWidget(text1, text2) {
    return Column(
      children: [
        Text(text1, style: AppTextstyles.exSmSecondary400),
        const SizedBox(height: 4),
        Text(text2, style: AppTextstyles.exSm600)
      ],
    );
  }
}

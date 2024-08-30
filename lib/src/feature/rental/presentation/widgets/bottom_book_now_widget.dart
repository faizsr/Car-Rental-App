import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/config/utils/custom_filled_button.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:flutter/material.dart';

class BottomBookNowWidget extends StatelessWidget {
  const BottomBookNowWidget({
    super.key,
    required this.rentalItem,
  });

  final RentalItemEntity rentalItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 100,
      color: AppColors.lTan,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('from'),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: montserrat),
                    children: [
                      TextSpan(
                        text: '₹${rentalItem.price}',
                        style: AppTextstyles.lg600,
                      ),
                      TextSpan(text: ' / day', style: AppTextstyles.exSm400)
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomFilledButton(
              text: 'Book Now',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

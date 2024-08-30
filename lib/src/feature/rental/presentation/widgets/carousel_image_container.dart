import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:flutter/material.dart';

class CourselImageContainer extends StatelessWidget {
  const CourselImageContainer({
    super.key,
    required this.rentalItem,
  });

  final RentalItemEntity rentalItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 500,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: rentalItem.imageUrls.length,
              itemBuilder: (context, index) {
                int indx = index + 1;
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        rentalItem.imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                        decoration: BoxDecoration(
                          color: AppColors.lBlack,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '$indx / ${rentalItem.imageUrls.length}',
                          style: AppTextstyles.exSmTeritiary600,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

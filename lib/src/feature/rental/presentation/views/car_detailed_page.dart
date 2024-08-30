import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/config/utils/custom_filled_button.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:flutter/material.dart';

class CarDetailedPage extends StatelessWidget {
  const CarDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalItem =
        ModalRoute.of(context)!.settings.arguments as RentalItemEntity;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 500,
                  width: MediaQuery.of(context).size.width,
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
                            bottom: 35,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                              decoration: BoxDecoration(
                                  color: AppColors.lBlack,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                '$indx / ${rentalItem.imageUrls.length}',
                                style: AppTextstyles.exSmTeritiary600,
                              ),
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
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 390,
                  decoration: BoxDecoration(
                    color: AppColors.lWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
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
                      Container(
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
                      ),
                      const SizedBox(height: 35),
                      const Text(
                        'Technical Specifications',
                        style: AppTextstyles.sm600,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                                    'Fuel Type',
                                    style: AppTextstyles.smSecondary500,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    rentalItem.fuel,
                                    style: AppTextstyles.sm600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                                    'Transmission',
                                    style: AppTextstyles.smSecondary500,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    rentalItem.transmission,
                                    style: AppTextstyles.sm600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
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
        ),
      ),
    );
  }
}

extension HexToColor on String {
  Color hexToColor() {
    return Color(
        int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000);
  }
}

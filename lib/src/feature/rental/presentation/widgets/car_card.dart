import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key});

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
              color: AppColors.lLightYellow,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://files.porsche.com/filestore/galleryimagerwd/multimedia/none/jdp-2016-982-718-bo-gallery-exterior-01/zoom2/a4eb987d-c173-11ec-80ef-005056bbdc38;sJ;twebp/porsche-zoom2.webp',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          Text('Porsche 718 Cayman S', style: AppTextstyles.md600),
          Text('2019', style: AppTextstyles.smSecondary500),
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
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontFamily: 'Montserrat'),
                  children: [
                    TextSpan(
                      text: '₹799',
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

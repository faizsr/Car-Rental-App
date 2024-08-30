import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/utils/custom_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPageAppbar extends StatelessWidget {
  const ListPageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Choose a Car', style: AppTextstyles.lg500),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: AppColors.lDarkPurple,
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Text('Kochi', style: AppTextstyles.smSecondary500),
                  ],
                ),
              ],
            ),

            // Profile Icon
            CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://i.pinimg.com/236x/5f/ee/a9/5feea9d9c21c106a9239bb17450dd9bc.jpg',
              ),
              backgroundColor: AppColors.lWhite,
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Search Field
        const CustomSearchField()
      ],
    );
  }
}

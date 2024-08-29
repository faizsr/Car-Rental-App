import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lWhite,
        hintText: 'Search Your Ride...',
        hintStyle: TextStyle(
          fontSize: 15,
          color: AppColors.lGray.withOpacity(0.2),
        ),
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: AppColors.lGray.withOpacity(0.2),
        ),
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

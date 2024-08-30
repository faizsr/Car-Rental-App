import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const   CustomInputField({
    super.key,
    required this.hintText,
    this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          color: AppColors.lGray.withOpacity(0.2),
        ),
        filled: true,
        fillColor: AppColors.lWhite,
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

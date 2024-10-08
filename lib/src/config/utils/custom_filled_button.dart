import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/rental_item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<RentalItemController>(
      builder: (context, value, child) {
        return MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          color: AppColors.lDarkPurple,
          minWidth: double.infinity,
          onPressed: onPressed,
          child: value.isUpload
              ? CupertinoActivityIndicator(color: AppColors.lWhite)
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.lWhite,
                    fontSize: 16,
                  ),
                ),
        );
      },
    );
  }
}

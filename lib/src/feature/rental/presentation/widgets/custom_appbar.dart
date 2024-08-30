import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back),
            ),
          ),
          const Spacer(),
          Text('Post Rental', style: AppTextstyles.md500),
          const Spacer(),
          const SizedBox(width: 60),
        ],
      ),
    );
  }
}

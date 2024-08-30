import 'dart:io';

import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/image_picker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class MultipleImageWidget extends StatelessWidget {
  const MultipleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerController>(
      builder: (context, value, child) {
        return Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: List.generate(
              value.imageFileList.length,
              (index) =>
                  imageContainer(index, value.imageFileList[index], context),
            ).followedBy(
              [if (value.imageFileList.length < 5) addImageContainer(context)],
            ).toList(),
          ),
        );
      },
    );
  }

  void onAddPressed(BuildContext context) async {
    context.read<ImagePickerController>().pickImage();
  }

  void onRemovePressed(XFile? file, BuildContext context) {
    context.read<ImagePickerController>().removeSelectedImages(file);
  }

  SizedBox imageContainer(int index, XFile? file, BuildContext context) {
    return SizedBox(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.lWhite,
          image: DecorationImage(
            image: FileImage(File(file?.path ?? '')),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
            ),
            style: IconButton.styleFrom(
              alignment: Alignment.center,
              iconSize: 18,
              backgroundColor: Colors.white.withOpacity(0.4),
            ),
            color: AppColors.lWhite,
            onPressed: () => onRemovePressed(file, context),
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    );
  }

  SizedBox addImageContainer(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () => onAddPressed(context),
        child: Container(
          alignment: Alignment.center,
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.lLightYellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lWhite,
            ),
            child: Icon(
              CupertinoIcons.add,
              size: 24,
              color: AppColors.lGray,
            ),
          ),
        ),
      ),
    );
  }
}

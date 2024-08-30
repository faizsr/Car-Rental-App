import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/utils/custom_filled_button.dart';
import 'package:car_rental_app/src/config/utils/custom_input_field.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/image_picker_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/rental_item_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/color_picker_widget.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/custom_appbar.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/multiple_image_widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PostNewRentalPage extends StatefulWidget {
  const PostNewRentalPage({super.key});

  @override
  State<PostNewRentalPage> createState() => _PostNewRentalPageState();
}

class _PostNewRentalPageState extends State<PostNewRentalPage> {
  final brandController = TextEditingController();
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final fuelController = TextEditingController();
  final transmissionController = TextEditingController();
  final priceController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Color selectedColor = AppColors.lWhite;

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<ImagePickerController>().clearSelectedImages();
      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: CustomAppbar(),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              subHeading('Select Image (Max 5)'),
              const SizedBox(height: 5),
              const MultipleImageWidget(),
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brand Input Field
                      subHeading('Brand', 0),
                      CustomInputField(
                        hintText: 'Eg: Porsche',
                        controller: brandController,
                      ),
                      const SizedBox(height: 10),

                      // Car Name Input Field
                      subHeading('Car Name', 0),
                      CustomInputField(
                        hintText: 'Eg: Cayman S',
                        controller: nameController,
                      ),
                      const SizedBox(height: 10),

                      dualInputField(
                          isColorPicker: true,
                          heading1: 'Manufactured Year',
                          hintText1: 'Eg: 2019',
                          controller1: yearController,
                          heading2: 'Color',
                          keyboardType: TextInputType.number),
                      dualInputField(
                        heading1: 'Fuel Type',
                        hintText1: 'Eg: Petrol',
                        controller1: fuelController,
                        hintText2: 'Eg: Manual',
                        heading2: 'Transmission',
                        controller2: transmissionController,
                      ),
                      const SizedBox(height: 10),

                      // Rent Price Input Field
                      subHeading('Rent Price (Per day)', 0),
                      CustomInputField(
                        hintText: 'Eg: ₹500',
                        controller: priceController,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 70)
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: showFab
              ? Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CustomFilledButton(
                    text: 'DONE',
                    onPressed: onDonePressed,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void onDonePressed() async {
    List<XFile?> images = context.read<ImagePickerController>().imageFileList;
    if (formkey.currentState!.validate() && images.isNotEmpty) {
      var rentalItem = RentalItemEntity(
        brand: brandController.text,
        carName: nameController.text,
        year: yearController.text,
        color: selectedColor.hexAlpha,
        fuel: fuelController.text,
        transmission: transmissionController.text,
        price: priceController.text,
        imageFiles: images,
      );

      await context.read<RentalItemController>().addNewRentalItem(rentalItem);
      if (mounted) Navigator.pop(context);
    }
  }

  Widget dualInputField({
    bool isColorPicker = false,
    required String hintText1,
    String hintText2 = '',
    required String heading1,
    required String heading2,
    TextEditingController? controller1,
    TextEditingController? controller2,
    TextInputType? keyboardType,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subHeading(heading1, 0),
              CustomInputField(
                hintText: hintText1,
                controller: controller1,
                keyboardType: keyboardType,
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subHeading(heading2, 0),
              isColorPicker
                  ? ColorPickerWidget(
                      dialogSelectColor: selectedColor,
                      onColorChanged: (color) {
                        selectedColor = color;
                        setState(() {});
                      })
                  : CustomInputField(
                      hintText: hintText2,
                      controller: controller2,
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Padding subHeading(String text, [double pdl = 20]) {
    return Padding(
      padding: EdgeInsets.fromLTRB(pdl, 10, 0, 10),
      child: Text(
        text,
        style: AppTextstyles.sm500,
      ),
    );
  }
}

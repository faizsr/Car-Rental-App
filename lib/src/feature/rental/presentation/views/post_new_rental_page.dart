import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/config/utils/custom_filled_button.dart';
import 'package:car_rental_app/src/config/utils/custom_input_field.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/color_picker_widget.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/custom_appbar.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/multiple_image_widget.dart';
import 'package:flutter/material.dart';

class PostNewRentalPage extends StatelessWidget {
  const PostNewRentalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppbar(),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            subHeading('Select Image'),
            const SizedBox(height: 5),
            const MultipleImageWidget(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand Input Field
                  subHeading('Brand', 0),
                  const CustomInputField(hintText: 'Eg: Porsche'),
                  const SizedBox(height: 10),

                  // Car Name Input Field
                  subHeading('Car Name', 0),
                  const CustomInputField(hintText: 'Eg: Cayman S'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Manufactured Year Input Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subHeading('Manufactured Year', 0),
                            const CustomInputField(hintText: 'Eg: 2019'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Color Picker Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subHeading('Color', 0),
                            const ColorPickerWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Fuel Type Input Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subHeading('Fuel Type', 0),
                            const CustomInputField(hintText: 'Eg: Petrol'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Transmission Input Field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subHeading('Transmission', 0),
                            const CustomInputField(hintText: 'Eg: Manuel'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Rent Price Input Field
                  subHeading('Rent Price (Per day)', 0),
                  const CustomInputField(hintText: 'Eg: ₹500'),
                  const SizedBox(height: 70)
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const CustomFilledButton(
            text: 'DONE',
          ),
        ),
      ),
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

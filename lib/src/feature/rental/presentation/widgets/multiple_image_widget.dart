import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class MultipleImageWidget extends StatelessWidget {
  const MultipleImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> images = ['a', 'b', 'c', 'd'];
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction: Axis.horizontal,
        children: List.generate(
          images.length,
          (index) => Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.lWhite,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ).followedBy([
          if (images.length == 4)
            Container(
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
            )
        ]).toList(),
      ),
    );
  }
}

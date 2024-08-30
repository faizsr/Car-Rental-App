import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/domain/usecases/add_new_rental_usecase.dart';
import 'package:flutter/material.dart';

class RentalItemController extends ChangeNotifier {
  final AddNewRentalUsecase addNewRentalUsecase;

  RentalItemController({required this.addNewRentalUsecase});

  bool isUpload = false;

  Future<void> addNewRentalItem(RentalItemEntity rentalItem) async {
    isUpload = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    // await addNewRentalUsecase.call(rentalItem);
    isUpload = false;
    notifyListeners();
  }
}

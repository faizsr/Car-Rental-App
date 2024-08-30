import 'dart:developer';

import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/domain/usecases/add_new_rental_usecase.dart';
import 'package:car_rental_app/src/feature/rental/domain/usecases/get_all_rentals_usecase.dart';
import 'package:flutter/material.dart';

class RentalItemController extends ChangeNotifier {
  final AddNewRentalUsecase addNewRentalUsecase;
  final GetAllRentalsUsecase getAllRentalsUsecase;

  RentalItemController({
    required this.addNewRentalUsecase,
    required this.getAllRentalsUsecase,
  });

  bool isUpload = false;
  bool isLoading = false;

  List<RentalItemEntity> rentalItems = [];

  Future<void> addNewRentalItem(RentalItemEntity rentalItem) async {
    isUpload = true;
    notifyListeners();
    await addNewRentalUsecase.call(rentalItem);
    isUpload = false;
    notifyListeners();
  }

  void getAllRentals() {
    isLoading = true;
    notifyListeners();

    final dataStream = getAllRentalsUsecase.call();
    dataStream.listen(
      (rentalList) {
        rentalItems = rentalList;
        isLoading = false;
        notifyListeners();
        log('Rentals Length: ${rentalItems.length}');
      },
    ).onError((error) {
      log('Error from fetching all Rentals: $error');
      isLoading = false;
      notifyListeners();
    });
  }
}

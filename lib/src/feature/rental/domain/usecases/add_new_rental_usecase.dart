import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/domain/repositories/rental_item_repository.dart';

class AddNewRentalUsecase {
  final RentalItemRepository rentalItemRepository;

  AddNewRentalUsecase({required this.rentalItemRepository});

  Future<void> call(RentalItemEntity rentalItem) async {
    await rentalItemRepository.addNewRentalItem(rentalItem);
  }
}

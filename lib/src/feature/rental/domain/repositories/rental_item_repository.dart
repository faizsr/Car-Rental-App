import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';

abstract class RentalItemRepository {
  Future<void> addNewRentalItem(RentalItemEntity rentalItem);
  Stream<List<RentalItemEntity>> getAllRentals();
}

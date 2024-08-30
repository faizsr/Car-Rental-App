import 'package:car_rental_app/src/feature/rental/data/data_sources/remote/rental_item_data_source.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/domain/repositories/rental_item_repository.dart';

class RentalItemRepositoryImpl implements RentalItemRepository {
  final RentalItemDataSource rentalItemDataSource;

  RentalItemRepositoryImpl({required this.rentalItemDataSource});

  @override
  Future<void> addNewRentalItem(RentalItemEntity rentalItem) async {
    await rentalItemDataSource.addNewRentalItem(rentalItem);
  }

  @override
  Stream<List<RentalItemEntity>> getAllRentals() {
    return rentalItemDataSource.getAllRentals();
  }
}

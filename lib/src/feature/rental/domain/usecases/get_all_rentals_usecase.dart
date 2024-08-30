import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:car_rental_app/src/feature/rental/domain/repositories/rental_item_repository.dart';

class GetAllRentalsUsecase {
  final RentalItemRepository rentalItemRepository;

  GetAllRentalsUsecase({required this.rentalItemRepository});

  Stream<List<RentalItemEntity>> call() {
    return rentalItemRepository.getAllRentals();
  }
}

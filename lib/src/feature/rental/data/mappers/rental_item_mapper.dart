import 'package:car_rental_app/src/feature/rental/data/models/rental_item_model.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';

class RentalItemMapper {
  static RentalItemEntity mapToEntity(RentalItemModel model) {
    return RentalItemEntity(
      id: model.id,
      brand: model.brand,
      carName: model.carName,
      color: model.color,
      fuel: model.fuel,
      price: model.price,
      transmission: model.transmission,
      year: model.year,
      imageFiles: model.imageFiles,
      imageUrls: model.imageUrls,
      timestamp: model.timestamp,
    );
  }

  static RentalItemModel mapToModel(RentalItemEntity entity) {
    return RentalItemModel(
      id: entity.id,
      brand: entity.brand,
      carName: entity.carName,
      color: entity.color,
      fuel: entity.fuel,
      price: entity.price,
      transmission: entity.transmission,
      year: entity.year,
      imageFiles: entity.imageFiles,
      imageUrls: entity.imageUrls,
      timestamp: entity.timestamp,
    );
  }
}

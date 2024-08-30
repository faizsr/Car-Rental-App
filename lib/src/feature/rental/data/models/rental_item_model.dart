import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';

class RentalItemModel extends RentalItemEntity {
  RentalItemModel({
    super.id,
    super.imageFiles,
    super.imageUrls,
    super.timestamp,
    required super.brand,
    required super.carName,
    required super.year,
    required super.color,
    required super.fuel,
    required super.transmission,
    required super.price,
  });

  factory RentalItemModel.fromJson(Map<String, dynamic>? json) {
    final map = json as Map<String, dynamic>;
    return RentalItemModel(
      id: map['id'] ?? '',
      brand: map['brand'],
      carName: map['car_name'],
      year: map['year'],
      color: map['color'],
      fuel: map['fuel'],
      transmission: map['transmission'],
      price: map['price'],
      imageUrls: (map['image_urls'] as List<dynamic>)
          .map((item) => item as String)
          .toList(),
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'car_name': carName,
      'year': year,
      'color': color,
      'fuel': fuel,
      'transmission': transmission,
      'price': price,
      'image_urls': imageUrls,
      'timestamp': timestamp,
    };
  }
}

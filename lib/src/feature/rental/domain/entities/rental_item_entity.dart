import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class RentalItemEntity {
  String id;
  final List<XFile?> imageFiles;
  List<String> imageUrls;
  Timestamp? timestamp;
  final String brand;
  final String carName;
  final String year;
  final String color;
  final String fuel;
  final String transmission;
  final String price;

  RentalItemEntity({
    this.id = '',
    this.imageFiles = const [],
    this.imageUrls = const [],
    this.timestamp,
    required this.brand,
    required this.carName,
    required this.year,
    required this.color,
    required this.fuel,
    required this.transmission,
    required this.price,
  });
}

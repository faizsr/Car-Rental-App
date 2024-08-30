import 'dart:developer';
import 'dart:io';

import 'package:car_rental_app/src/feature/rental/data/data_sources/remote/rental_item_data_source.dart';
import 'package:car_rental_app/src/feature/rental/data/mappers/rental_item_mapper.dart';
import 'package:car_rental_app/src/feature/rental/data/models/rental_item_model.dart';
import 'package:car_rental_app/src/feature/rental/domain/entities/rental_item_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RentalItemDataSourceImpl implements RentalItemDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseStorage fireStorage;

  RentalItemDataSourceImpl({
    required this.fireStore,
    required this.fireStorage,
  });

  FirebaseFirestore get storeInstance => fireStore;
  FirebaseStorage get storageInstance => fireStorage;

  @override
  Future<void> addNewRentalItem(RentalItemEntity rentalItem) async {
    log('Adding New Rental');
    List<String> imageUrls = [];

    try {
      imageUrls = await Future.wait(
        rentalItem.imageFiles.map(
          (file) async {
            Reference refDirImages =
                storageInstance.ref().child('rentals/${file!.path}');
            await refDirImages.putFile(File(file.path));
            return await refDirImages.getDownloadURL();
          },
        ),
      );
      log('Image Urls Length: ${imageUrls.length}');
      log('Image Urls : $imageUrls');
    } catch (e) {
      log(e.toString());
    }

    DocumentReference docRef = storeInstance.collection('rentals').doc();
    log('Document Id When Saving: ${docRef.id}');

    RentalItemModel rentalItemModel = RentalItemMapper.mapToModel(rentalItem);
    rentalItemModel.id = docRef.id;
    rentalItemModel.imageUrls = imageUrls;
    rentalItemModel.timestamp = Timestamp.now();

    await docRef.set(rentalItemModel.toMap());

    log('Success');
  }

  @override
  Stream<List<RentalItemEntity>> getAllRentals() {
    try {
      final data = storeInstance.collection('rentals').orderBy("timestamp",descending: true).snapshots().map(
        (snapshot) {
          return snapshot.docs.map(
            (doc) {
              final data = doc.data();
              final rentalItemModel = RentalItemModel.fromJson(data);
              return RentalItemMapper.mapToEntity(rentalItemModel);
            },
          ).toList();
        },
      );
      return data;
    } catch (e) {
      log('On Error: $e');
      return const Stream.empty();
    }
  }
}

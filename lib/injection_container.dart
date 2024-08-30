import 'package:car_rental_app/firebase_options.dart';
import 'package:car_rental_app/src/feature/rental/data/data_sources/remote/rental_item_data_source.dart';
import 'package:car_rental_app/src/feature/rental/data/data_sources/remote/rental_item_data_source_impl.dart';
import 'package:car_rental_app/src/feature/rental/data/repositories/rental_item_repository_impl.dart';
import 'package:car_rental_app/src/feature/rental/domain/repositories/rental_item_repository.dart';
import 'package:car_rental_app/src/feature/rental/domain/usecases/add_new_rental_usecase.dart';
import 'package:car_rental_app/src/feature/rental/domain/usecases/get_all_rentals_usecase.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/image_picker_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/rental_item_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // ---------------------- External ----------------------
  final imagePickerInstance = ImagePickerPlatform.instance;
  final fireStore = FirebaseFirestore.instance;
  final fireStorage = FirebaseStorage.instance;
  final imagePicker = ImagePicker();

  getIt.registerLazySingleton(() => fireStore);
  getIt.registerLazySingleton(() => fireStorage);
  getIt.registerLazySingleton(() => imagePicker);

  // ---------- Image Picker Config (for enabling limit option) ----------
  if (imagePickerInstance is ImagePickerAndroid) {
    imagePickerInstance.useAndroidPhotoPicker = true;
  }

  // ---------------------- Provider Controller ----------------------
  getIt.registerFactory<RentalItemController>(
    () => RentalItemController(
      addNewRentalUsecase: getIt.call(),
      getAllRentalsUsecase: getIt.call(),
    ),
  );
  getIt.registerFactory<ImagePickerController>(
    () => ImagePickerController(
      imagePicker: getIt.call(),
    ),
  );

  // ---------------------- Use Cases ----------------------
  getIt.registerLazySingleton<AddNewRentalUsecase>(
    () => AddNewRentalUsecase(rentalItemRepository: getIt.call()),
  );
  getIt.registerLazySingleton<GetAllRentalsUsecase>(
    () => GetAllRentalsUsecase(rentalItemRepository: getIt.call()),
  );

  // ---------------------- Repository ----------------------
  getIt.registerLazySingleton<RentalItemRepository>(
    () => RentalItemRepositoryImpl(rentalItemDataSource: getIt.call()),
  );

  // ---------------------- Repository ----------------------
  getIt.registerLazySingleton<RentalItemDataSource>(
    () => RentalItemDataSourceImpl(
      fireStorage: getIt.call(),
      fireStore: getIt.call(),
    ),
  );
}

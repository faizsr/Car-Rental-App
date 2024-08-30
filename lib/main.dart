import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/strings.dart';
import 'package:car_rental_app/src/config/constants/system_style.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/image_picker_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/rental_item_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/car_detailed_page.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/cars_list_page.dart';
import 'package:car_rental_app/src/feature/rental/presentation/views/post_new_rental_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemStyle();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.getIt.get<ImagePickerController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.getIt.get<RentalItemController>(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Car Rentel App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: montserrat,
            scaffoldBackgroundColor: AppColors.lTan,
          ),
          routes: {
            '/new-rental': (context) => const PostNewRentalPage(),
            '/car-detailed': (context) => const CarDetailedPage(),
          },
          home: const CarsListPage(),
        ),
      ),
    );
  }
}

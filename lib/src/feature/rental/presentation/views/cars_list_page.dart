import 'package:car_rental_app/src/config/constants/app_colors.dart';
import 'package:car_rental_app/src/config/constants/app_textstyles.dart';
import 'package:car_rental_app/src/feature/rental/presentation/controllers/rental_item_controller.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/brand_list_widget.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/car_card.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/car_card_loading.dart';
import 'package:car_rental_app/src/feature/rental/presentation/widgets/list_page_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarsListPage extends StatelessWidget {
  const CarsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RentalItemController>().getAllRentals();
    });
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: ListPageAppbar(),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            subHeading('Brands'),
            const BrandListWidget(),
            subHeading('Available Rentals'),
            carsListWidget(),
          ],
        ),
        floatingActionButton: postNewRentalBtn(context),
      ),
    );
  }

  Consumer carsListWidget() {
    return Consumer<RentalItemController>(
      builder: (context, value, child) {
        return value.isLoading
            ? ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) => const CarCardLoading(),
              )
            : value.rentalItems.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                      child: Text(
                        'No Cars Available',
                        style: AppTextstyles.smSecondary500,
                      ),
                    ),
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    itemCount: value.rentalItems.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) => CarCard(
                      rentalItem: value.rentalItems[index],
                    ),
                  );
      },
    );
  }

  Widget postNewRentalBtn(context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.lDarkPurple,
      elevation: 0,
      onPressed: () => Navigator.pushNamed(context, '/new-rental'),
      label: Text('POST NEW RENTAL?', style: AppTextstyles.exSmTeritiary600),
    );
  }

  Padding subHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Text(text, style: AppTextstyles.sm600),
    );
  }
}

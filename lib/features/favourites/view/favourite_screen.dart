import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/list_empty_widget.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/features/favourites/controller/favourite_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/text_bold.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavouriteController>(context, listen: false)
          .getAllFeverateList(context);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Favourites'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<FavouriteController>(
          builder: (context, controller, child) {
            return controller.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kGreenColor,
                    ),
                  )
                : controller.favaerateList.isEmpty
                    ? ListEmptyWidget(
                        buttonText: 'Go to shop',
                        title: 'No  Favourites Yet!',
                        onTap: () {},
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: GridView.builder(
                          primary: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: .7,
                          ),
                          itemCount: controller.favaerateList.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                ProductCard(
                                  productId: controller.favaerateList[index].productId,
                                  images:
                                      controller.favaerateList[index].image ??
                                          '',
                                  catName: controller
                                          .favaerateList[index].subCategory ??
                                      ' sub',
                                  price: controller.favaerateList[index].price
                                      .toString(),
                                  productName: controller
                                          .favaerateList[index].productName ??
                                      'product name',
                                  showFaviorateButton: false,
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        RouteName.productDeatailsScreen,arguments: controller.favaerateList[index].productId,);
                                  },
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.kblack),
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColor.kWhiteColor,
                                          size: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        
                                        controller.deleteFavorite(
                                            favoriteId: controller
                                                .favaerateList[index].sId
                                                .toString(),
                                            context: context);
                                      },
                                    ))
                            
                            
                              ],
                            );
                          },
                        ),
                      );
          },
        ),
      ),
    );
  }
}

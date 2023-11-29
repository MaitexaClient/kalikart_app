import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/list_empty_widget.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/favourites/controller/favourite_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/text_bold.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            return controller.favaerateList.isEmpty
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          images: '',
                          catName: '',
                          price: '',
                          productName: '',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteName.productDeatailsScreen);
                          },
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

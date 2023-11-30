import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/list_empty_widget.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({this.categoryName, super.key, this.catId});

  final String? categoryName;
  final String? catId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductDetailsController>(context, listen: false)
          .getAllProductByCat(context,widget.catId!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: widget.categoryName!),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Consumer<ProductDetailsController>(
          builder: (context, controller, child) {
            return controller.loading
                ? const Center(
                    child:
                        CircularProgressIndicator(color: AppColor.kGreenColor),
                  )
                : controller.productList.isEmpty
                    ? ListEmptyWidget(
                        isButton: true,
                        buttonText: '',
                        title: 'No Products',
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
                          itemCount: controller.productList.length,
                          itemBuilder: (context, index) {
                            
                            return ProductCard(
                              images: controller.productList[index].image != null ?  controller.productList[index].image![0]  :'https://static.thenounproject.com/png/482114-200.png',
                              productName: controller.productList[index].productName??'product name',
                              price: controller.productList[index].price.toString(),
                              catName: controller.productList[index].subCategory??'sub',
                             
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.productDeatailsScreen,arguments: controller.productList[index].sId??'');
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

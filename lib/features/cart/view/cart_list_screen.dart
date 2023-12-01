import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/list_empty_widget.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/cart/controller/cart_controller.dart';
import 'package:kalicart/features/cart/widget/sub_row_text_widget.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartController>(context, listen: false)
          .getAllcart(context);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Cart'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartController>(
        builder: (context, controller, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:controller.loading ? 
           const Center(child: CircularProgressIndicator(color: AppColor.kGreenColor),)  : 
           controller.allCartData == null 
              ? Center(
                child: ListEmptyWidget(
                    title: 'Your Cart Is Empty!',
                    buttonText: 'Add  Cart',
                    onTap: () {},
                  ),
              )
              : Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: controller.allCartData?.cartProducts?.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  width: 104.w,
                                  height: 130.h,
                                  imageUrl: controller.allCartData?.cartProducts![index].image ?? 'https://png.pngtree.com/element_our/20200610/ourmid/pngtree-character-default-avatar-image_2237203.jpg',
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: AppColor.kGreenColor,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: AppColor.kLightGray,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: SemiBoldTextStyle(
                                      size: 12.sp,
                                      text: controller.allCartData!.cartProducts![index].subCategory!,
                                      color:
                                          AppColor.kGreenColor.withOpacity(.6),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SemiBoldTextStyle(
                                      size: 16.sp, text: controller.allCartData!.cartProducts![index].productName!,),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RegularTextStyle(size: 14.sp, text: '₹${controller.allCartData!.cartProducts![index].price}'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () async{

                                   await controller.decreament(controller.allCartData!.cartProducts![index].sId.toString(), context);
                                  
                                  },
                                  icon:
                                      const Icon(Icons.remove_circle_outline)),
                              RegularTextStyle(size: 14.sp, text: controller.allCartData!.cartProducts![index].quantity!.toString()),
                              IconButton(
                                onPressed: () async{

                                  await controller.increament(controller.allCartData!.cartProducts![index].sId.toString(), context);
                                   


                                },
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SubRowTextWidget(
                            prfixText: 'total',
                            suffixText: controller.allCartData!.total.toString(),
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColor.kGray,
                          ),
                          const SubRowTextWidget(
                            prfixText: 'offer',
                            suffixText: '0',
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColor.kGray,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SemiBoldTextStyle(size: 18.sp, text: 'Total'),
                              SemiBoldTextStyle(size: 18.sp, text: '₹${controller.allCartData!.total}'),
                            ],
                          ),
                          PrimaryButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteName.checkOutScreen);
                              },
                              buttonText: 'Check out')
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

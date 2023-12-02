import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductDetailsController>(context, listen: false)
          .getSingleProduct(context, productId);
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Product Details'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<ProductDetailsController>(
          builder: (context, controller, child) {
        return controller.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.kGreenColor,
                ),
              )
            : controller.singleProductDeatails == null
                ? Center(
                    child: BoldTextStyle(size: 20.sp, text: 'No Details'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.6,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl: controller.singleProductDeatails?.image ==
                                    null
                                ? 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D'
                                : controller.singleProductDeatails?.image![0],
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.kGreenColor,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: AppColor.kLightGray,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SemiBoldTextStyle(
                                    size: 14.sp,
                                    text: controller.singleProductDeatails
                                            ?.subCategory ??
                                        'product name',
                                    color: AppColor.kGreenColor.withOpacity(.6),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SemiBoldTextStyle(
                                    size: 16.sp,
                                    text: controller.singleProductDeatails
                                            ?.productName ??
                                        'product name'),
                                const SizedBox(
                                  height: 10,
                                ),
                                RegularTextStyle(
                                    size: 14.sp,
                                    text:
                                        '₹ ${controller.singleProductDeatails?.price}'),
                                const SizedBox(
                                  height: 20,
                                ),
                                BoldTextStyle(size: 20.sp, text: 'Description'),
                                RegularTextStyle(
                                    size: 16.sp,
                                    text: controller.singleProductDeatails
                                            ?.description ??
                                        'description')
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PrimaryButton(
                            onPressed: () {
                              controller.addCart(productId: controller.singleProductDeatails!.sId!, price: controller.singleProductDeatails!.price!.toString(), context: context);
                            }, buttonText: 'Add  to  cart'),
                      )
                    ],
                  );
      }),
    );
  }
}

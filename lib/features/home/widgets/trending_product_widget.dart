import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_outlined_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/product/view/product_details_screen.dart';
import 'package:kalicart/features/product/view/product_details_screen_new.dart';

class TrendingProductWidget extends StatelessWidget {
  TrendingProductWidget({super.key});

  List trendingList = [
    'https://www.seekpng.com/png/full/377-3771491_doritos-png-doritos-transparent-png-2012-pepsico-annual.png',
    'https://www.seekpng.com/png/full/375-3750834_tecate-buscar-ms-consumidores-con-nueva-imagen-tecate.png',
    'https://www.seekpng.com/png/full/115-1158032_variety-box-seasoned-nuts-4oz-4-pack-nuts.png',
    'https://www.seekpng.com/png/full/115-1158910_sierra-nevada-southern-hemisphere-hop-pack-12pk-cans.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trendingList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreenNew(
                      title: "Honey: Nature's Sweet Elixir",
                      quantity: '1 L',
                      price: '₹80',
                      brandName: 'brand name',
                      discountedPrice: '₹180',
                      imageUrl: trendingList[index],
                      productTitle: "Honey: Nature's Sweet Elixir",
                    ),
                  ));
            },
            child: Container(
              height: 300,
              width: 120,
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.kGray),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: CachedNetworkImage(
                            height: 80,
                            width: 80,
                            imageUrl: trendingList[index],
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.kGreenColor,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const RegularTextStyle(
                            size: 13, text: 'Dukes', color: Colors.grey),
                        const SizedBox(
                          width: 110,
                          child: Text(
                            "Honey: Nature's Sweet Elixir",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹80',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 3),
                                ),
                                Text(
                                  '₹180',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.kblack,
                                    decorationThickness: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: CustomOutlineButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartListScreen(),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

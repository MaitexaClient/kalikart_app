import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_outlined_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/product/view/product_details_screen_new.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class ExclusiveWidget extends StatelessWidget {
  ExclusiveWidget({super.key});

  final List list = [
    'https://freepngimg.com/thumb/grocery/41893-5-jar-of-honey-image-free-transparent-image-hq-thumb.png',
    'https://www.seekpng.com/png/full/237-2370481_aashirwad-flour-aashirvaad-atta-10-kg.png',
    'https://www.seekpng.com/png/full/183-1837282_1536973257-coca-coca-cola-fridge-pack-cans-12.png',
    'https://www.seekpng.com/png/full/421-4212034_snack-pack-banana-cream-pie-pudding.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreenNew(
                    
                    title: "Honey: Nature's Sweet Elixir",
                    quantity:  '1 L',
                    price: '₹80',
                    brandName: 'brand name',
                    discountedPrice: '₹180',
                    imageUrl: list[index],
                    productTitle: "Honey: Nature's Sweet Elixir",

                  ),));
            },
            child: Container(
              height: 300,
              width: 120,
              margin: const EdgeInsets.only(right: 15),
              foregroundDecoration: const RotatedCornerDecoration.withColor(
                color: Colors.red,
                spanBaselineShift: 2,
                badgeSize: Size(60, 60),
                badgeCornerRadius: Radius.circular(8),
                badgePosition: BadgePosition.topStart,
                textSpan: TextSpan(
                  text: 'OFF\n 50%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                            imageUrl: list[index],
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: AppColor.kGreenColor,
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
                          child:Text(
                            "Honey: Nature's Sweet Elixir",
                            
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
          
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600
          
                            ),
                          
                            
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
                            const  SizedBox(width: 12,),
                            Expanded(
                              child: CustomOutlineButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartListScreen(),));
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

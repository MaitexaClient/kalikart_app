import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_outlined_button.dart';
import 'package:kalicart/common/widgets/medium_text.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';

class ProductDetailsScreenNew extends StatelessWidget {
  const ProductDetailsScreenNew({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.productTitle,
    required this.quantity,
    required this.price,
    required this.discountedPrice,
    required this.brandName,
  });

  final String title;
  final String imageUrl;
  final String productTitle;
  final String quantity;
  final String price;
  final String discountedPrice;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLightGray,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: AppColor.kblack),
        centerTitle: true,
        title: Text(
          productTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.kGreenColor,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )),
                      SizedBox(
                        height: 100.h,
                      ),
                      RegularTextStyle(
                          size: 13, text: brandName, color: Colors.black54),
                      const SizedBox(
                        height: 5,
                      ),
                      MediumTextStyle(size: 18, text: productTitle),
                      Text(
                        quantity,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          decorationThickness: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 3,
                                ),
                              ),
                              Text(
                                discountedPrice,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kblack,
                                  decorationThickness: 3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.kLightGray,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CustomOutlineButton(
                                onPressed: () {
                                  //add to cart
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CartListScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumTextStyle(size: 16, text: 'Description'),
                      SizedBox(
                        height: 10,
                      ),
                      RegularTextStyle(
                          size: 14,
                          color: Colors.grey,
                          text:
                              "In the heart of the bustling city, the vibrant marketplace buzzed with activity. The air was filled with the aroma of exotic spices and the melodic calls of vendors vying for the attention of passersby. Colorful stalls lined the narrow alleys, displaying an array of goods from handcrafted trinkets to fresh produce. As sunlight streamed through the gaps between the buildings, casting a warm glow on the scene, people from all walks of life navigated the labyrinthine market, engaged in animated conversations and haggling over prices. Each corner revealed a new facet of the city's culture, creating a tapestry of sights, sounds, and smells that captured the essence of its rich and diverse community.")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

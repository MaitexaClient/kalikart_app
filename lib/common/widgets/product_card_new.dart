import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_outlined_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class ProductCardNew extends StatelessWidget {
  final  String productName;
  final  String unit;
  final  String originalPrice;
  final  String discountedPrice;
  final  String dukesText;

  const ProductCardNew({Key? key, required this.productName, required this.unit, required this.originalPrice, required this.discountedPrice, required this.dukesText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
           RegularTextStyle(size: 13, text: dukesText, color: Colors.black54),
          const SizedBox(height: 5),
           SizedBox(
            width: 120,
            child: Text(
              productName,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              decorationThickness: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    originalPrice,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 3,
                    ),
                  ),
                  Text(
                    discountedPrice,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColor.kblack,
                      decorationThickness: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  decoration:  const BoxDecoration(
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
                    },
                  ),
                ),
              ),
            ],
          ),
        
        
        
        ]
        
         ),
    );
 
 
 
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class CardColumnWidget extends StatelessWidget {
  const CardColumnWidget({
    super.key, required this.image, required this.text, required this.onTap,
  });

  final  String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
             
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: AppColor.kLightGray,
                borderRadius: BorderRadius.circular(15)),
            child: CachedNetworkImage(
             width: 85.h,
              height: 85.h,
              imageUrl:
                  image,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(
                color: AppColor.kGreenColor,
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RegularTextStyle(
            text: text,
            size: 14.sp,
            textAlign: TextAlign.center,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}


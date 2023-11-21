import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class CardColumnWidget extends StatelessWidget {
  const CardColumnWidget({
    super.key, required this.image, required this.text,
  });

  final  String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              color: AppColor.kLightGray,
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: CachedNetworkImage(
              width: 60.h,
              height: 60.h,
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
        ),
        const SizedBox(
          height: 5,
        ),
        RegularTextStyle(
          text: text,
          size: 14.sp,
        )
      ],
    );
  }
}


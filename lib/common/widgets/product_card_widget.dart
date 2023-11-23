import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key,required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: 177.w,
                    imageUrl:
                        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                      child: const CircularProgressIndicator(
                        color: AppColor.kGreenColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColor.kLightGray,
                    borderRadius: BorderRadius.circular(30)),
                child: SemiBoldTextStyle(
                  size: 12.sp,
                  text: 'Categoryname',
                  color: AppColor.kGreenColor.withOpacity(.6),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SemiBoldTextStyle(size: 16.sp, text: 'Head phone'),
              const SizedBox(
                height: 10,
              ),
              RegularTextStyle(size: 14.sp, text: '₹100'),
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: 177.w,
              //   child: PrimaryButton(
              //     height: 30,
              //     onPressed: () {

              //   }, buttonText: 'Add to Cart'),
              // )
            ],
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.kblack),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: AppColor.kWhiteColor,
                    size: 16,
                  ),
                ),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

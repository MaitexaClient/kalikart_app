import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({
    super.key, required this.title, required this.buttonText, required this.onTap,
  });

  final String title;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fav.png',
            width: 100.h,
            height: 100.h,
          ),

          const SizedBox(
            height: 20,
          ),
          BoldTextStyle(size: 20.sp, text: title),
          // RegularTextStyle(size: 16.sp, text: 'Commodo odio aenean\nsed adipiscing !'),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: const BorderSide(color: AppColor.kGreenColor)),
              onPressed: () {},
              child: BoldTextStyle(
                size: 18.sp,
                color: AppColor.kGreenColor,
                text:  buttonText,
              ))
        ],
      );
  }
}

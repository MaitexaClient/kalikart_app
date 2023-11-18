import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class HeadText extends StatelessWidget {
  const HeadText({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldTextStyle(size: 28.sp, text: title),
        const SizedBox(
          height: 10,
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child: RegularTextStyle(
            size: 16.sp,
            text: subTitle,
          ),
        ),
      ],
    );
  }
}

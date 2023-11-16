import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';

class SpanText extends StatelessWidget {
  const SpanText({
    super.key, required this.text, required this.buttonText,required this.onTap
  });

  final String text;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(children: [
           TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColor.kblack
    
            )
          ),
          TextSpan(
              text:  buttonText,
              style:  TextStyle(
                color: AppColor.kGreenColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap),
        ]),
      ),
    );
  }
}

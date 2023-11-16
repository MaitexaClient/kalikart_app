import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.onPressed, required this.buttonText});

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(

          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    
          backgroundColor: AppColor.kGreenColor,
        ),
        onPressed: onPressed,
        child: BoldTextStyle(
          size: 18.sp,
          text: buttonText,
          color: Colors.white,
        ),
      ),
    );
  }
}

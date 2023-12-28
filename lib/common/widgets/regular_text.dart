import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class RegularTextStyle extends StatelessWidget {
  const RegularTextStyle({super.key, required this.size, required this.text,this.color,this.textAlign});

  final  double  size;
  final String text;
  final Color ? color;
  final TextAlign ? textAlign;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color ?? AppColor.kblack
      ),

    );
  }
}
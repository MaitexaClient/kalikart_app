import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class SemiBoldTextStyle extends StatelessWidget {
  const SemiBoldTextStyle({super.key, required this.size, required this.text, this.color});

  final  double  size;
  final String text;
  final Color ? color;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color:  color ?? AppColor.kblack
      ),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class BoldTextStyle extends StatelessWidget {
   BoldTextStyle({super.key, required this.size, required this.text ,this.color,this.align});

  final  double  size;
  final String text;
  Color ? color;
  final TextAlign ? align;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color ?? AppColor.kblack
      ),

    );
  }
}
import 'package:flutter/material.dart';

class RegularTextStyle extends StatelessWidget {
  const RegularTextStyle({super.key, required this.size, required this.text});

  final  double  size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400
      ),

    );
  }
}
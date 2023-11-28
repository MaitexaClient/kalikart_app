

import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class CustomMaxEditTextField extends StatelessWidget {
  const CustomMaxEditTextField({
    super.key,
    required this.labelText
  });
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color:AppColor.kblack30 ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: AppColor.kblack30), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color:AppColor.kblack30), // Border color when focused
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
      cursorColor: AppColor.kblack30 ,
    );
  }
}
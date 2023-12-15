

import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class CustomMaxEditTextField extends StatelessWidget {
  const CustomMaxEditTextField({
    super.key,
    required this.labelText, required this.controller
  });
  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color:AppColor.kblack30 ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AppColor.kblack30), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color:AppColor.kblack30), // Border color when focused
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
      cursorColor: AppColor.kblack30 ,
    );
  }
}
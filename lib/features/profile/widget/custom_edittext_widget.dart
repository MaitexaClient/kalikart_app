

import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({
    super.key,
    required this.labelText,
    required this.textEditingController,
     this.isEnabled
  });
  final String labelText;
  final TextEditingController textEditingController;
  final bool ? isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:  textEditingController,
      
      decoration: InputDecoration(
        labelText: labelText,
        enabled:  isEnabled??true,
        labelStyle: const TextStyle(color:AppColor.kblack30 ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AppColor.kblack30), // Border color when enabled
        ),
         disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: AppColor.kblack40,width: .5), // Border color when enabled
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
import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomOutlineButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColor.kGray),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          
        ),
        fixedSize: const  Size.fromHeight(30),
        elevation: .3,
        shadowColor: AppColor.kLightGray,
        backgroundColor: Colors.white
            
      ),
      child: const Text(
        'ADD',
        style: TextStyle(
          color: AppColor.kGreenColor,
          fontSize: 13,
          fontWeight: FontWeight.w800
          ),
        ),
    );
  }
}
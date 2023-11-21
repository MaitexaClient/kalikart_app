import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.hintText,
      this.isPassword = false,
      this.validator,
      this.onSaved,
      this.borderColor,
      this.labelColor,
      this.onChanged,
      this.keyboardType, this.maxLength
      });

  final String label;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String> ?onSaved;
  final void Function(String)? onChanged;
  final Color ? borderColor;
  final Color ? labelColor;
  final TextInputType? keyboardType;
  final int ? maxLength;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: borderColor ?? AppColor.kblack20,
              width: 1.0,
            ),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            obscureText: isPassword,
            onChanged: onChanged,
            maxLength: maxLength,
          
            cursorColor: AppColor.kblack,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          top: -8,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            color:  AppColor.kWhiteColor,
            child: RegularTextStyle(
              size: 14.sp,
              text: label,
              color:labelColor ?? AppColor.kblack40,
            ),
          ),
        ),
      ],
    );
  }
}

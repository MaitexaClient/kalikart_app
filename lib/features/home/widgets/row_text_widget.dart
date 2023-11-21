import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';

class RowTextWidget extends StatelessWidget {
  const RowTextWidget({
    super.key,
    required this.leadText,
    required this.actionText,
    required this.action,
  });

  final String leadText;
  final String actionText;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoldTextStyle(size: 22.sp, text: leadText),
          GestureDetector(
            child: SemiBoldTextStyle(
              size: 14.sp,
              text: actionText,
              color: AppColor.kblack40,
            ),
          )
        ],
      ),
    );
  }
}

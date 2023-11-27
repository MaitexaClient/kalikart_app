import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({super.key, required this.tileText, required this.onTap, required this.icon});

  final String tileText;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
              leading:  Icon(icon),
              title:  RegularTextStyle(size: 16.sp, text: tileText),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: onTap,
              
            ),
            const Divider(
              height: 10,
              color: AppColor.kLightGray,
              thickness: 1,
            )
      ],
    );
  }
}
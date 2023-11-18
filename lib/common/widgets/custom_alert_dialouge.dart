import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/Cart.png',height: 100.h,width:100.h,),
          const SizedBox(height: 20.0),
          BoldTextStyle(size: 20.sp, text: 'Account Created'),
          const SizedBox(height: 20.0),
          Text(
            'Your account has been successfully created!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.kblack),
          ),
          const SizedBox(height: 20.0),
          PrimaryButton(onPressed: () {
            
          }, buttonText: 'Ok')
        ],
      ),
    );
  }
}

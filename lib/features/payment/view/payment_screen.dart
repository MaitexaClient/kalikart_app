import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/medium_text.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  void initState() {

  

    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     const sizedBox =  SizedBox(
      height: 20,
    );
    return Scaffold(
      backgroundColor: AppColor.kGreenColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/Vector.png', width: 132.h, height: 132.h),
          sizedBox,
          BoldTextStyle(
            size: 20.sp,
            text: 'Your order has been received',
            color: AppColor.kWhiteColor,
          ),
          const SizedBox(
            height: 10,
          ),
          MediumTextStyle(
            size: 15.sp,
            text: 'Status: On-Hold',
            color: AppColor.kWhiteColor,
          ),
          const SizedBox(height: 5,),
          MediumTextStyle(
            size: 15.sp,
            text: 'Order ID: 74123698',
            color: AppColor.kWhiteColor,
          ),
          sizedBox,
          SizedBox(
            width: 200.w,
            child: PrimaryButton(
              onPressed: () {},
              buttonText: 'Continue',
              color: AppColor.kWhiteColor,
              buttonTextColor: AppColor.kblack,
            ),
          )
        ]),
      ),
    );
  
  
  }
}
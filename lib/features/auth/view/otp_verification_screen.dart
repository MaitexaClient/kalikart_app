import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/widgets/custom_alert_dialouge.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/features/auth/widgets/head_text.dart';
import 'package:kalicart/features/auth/widgets/otp_verify_box.dart';
import 'package:kalicart/features/auth/widgets/span_text.dart';

class OTPverificationScreen extends StatelessWidget {
  const OTPverificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const HeadText(
                  title: 'Verify',
                  subTitle:
                      'Sit amet consectetur adipiscing elit duis tristique sollicitudin'),
              SizedBox(
                height: 50.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerifyOTPBox(),
                  VerifyOTPBox(),
                  VerifyOTPBox(),
                  VerifyOTPBox(),
                  VerifyOTPBox()
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              PrimaryButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const CustomAlertDialog();
                      },
                    );
                  },
                  buttonText: 'Verify'),
              const Spacer(
                flex: 3,
              ),
              SpanText(
                text: 'Didn’t recieve code? ',
                buttonText: 'Resend',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

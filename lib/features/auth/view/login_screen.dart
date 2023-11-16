import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/widgets/custom_text_field.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/auth/widgets/span_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              BoldTextStyle(size: 28.sp, text: 'Login'),
              const SizedBox(height: 10,),
              RegularTextStyle(
                size: 16.sp,
                text:
                    'Sit amet consectetur adipiscing elit duis\ntristique sollicitudin',
              ),
               SizedBox(height: 60.h,),
              const CustomTextField(
                label: 'Email',
                hintText: 'Enter your Email',
              ),
              const SizedBox(height: 25),
               CustomTextField(
                label: 'Password',
                hintText: 'Enter your Password',
                validator: (value) {
                  
                },
              ),

              const SizedBox(height: 10),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: RegularTextStyle(
                    size: 16.sp,
                    text: 'Forgot Password?',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              PrimaryButton(onPressed: () {}, buttonText: 'Login'),
              const Spacer(flex: 2,),
              SpanText(
                text: 'Don’t have account?',
                buttonText: 'Sign Up',
                onTap: () {
                  print('signin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


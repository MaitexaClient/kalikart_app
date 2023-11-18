import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_text_field.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/auth/controller/auth_controller.dart';
import 'package:kalicart/features/auth/widgets/span_text.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Consumer<AuthController>(builder: (context, controller, child) {
            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  BoldTextStyle(size: 28.sp, text: 'Sign up'),
                  const SizedBox(
                    height: 10,
                  ),
                  RegularTextStyle(
                    size: 16.sp,
                    text:
                        'Sit amet consectetur adipiscing elit duis\ntristique sollicitudin',
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  //name text field
                  CustomTextField(
                    label: 'Name',
                    borderColor: AppColor.kblack20,
                    hintText: 'Enter your name',
                    labelColor: AppColor.kblack40,
                    onChanged: (value) {},
                    onSaved: (newValue) {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //emil text field
                  CustomTextField(
                    label: 'Email',
                    borderColor: controller.emailErrorText.isEmpty
                        ? AppColor.kblack20
                        : AppColor.kSecondaryRed,
                    hintText: 'Enter your email',
                    labelColor: controller.emailErrorText.isEmpty
                        ? AppColor.kblack40
                        : AppColor.kSecondaryRed,
                    onChanged: (value) {
                      controller.validateEmail(value);
                    },
                    onSaved: (newValue) {
                      controller.email = newValue;
                    },
                  ),

                  controller.emailErrorText.isEmpty
                      ? const SizedBox.shrink()
                      : RegularTextStyle(
                          size: 14.sp,
                          text: controller.emailErrorText,
                          color: AppColor.kSecondaryRed,
                        ),
                  const SizedBox(height: 25),

                  //password  text field
                  CustomTextField(
                    borderColor: controller.passwordError.isEmpty
                        ? AppColor.kblack20
                        : AppColor.kSecondaryRed,
                    labelColor: controller.passwordError.isEmpty
                        ? AppColor.kblack40
                        : AppColor.kSecondaryRed,
                    label: 'Password',
                    hintText: 'Enter your Password',
                    onChanged: (value) {
                      controller.validatePassword(value);
                    },
                    onSaved: (newValue) {
                      controller.password = newValue;
                    },
                  ),
                  controller.passwordError.isEmpty
                      ? const SizedBox.shrink()
                      : RegularTextStyle(
                          size: 14.sp,
                          text: controller.passwordError,
                          color: AppColor.kSecondaryRed,
                        ),

                  const SizedBox(height: 25),

                  //confirm text field
                  CustomTextField(
                    borderColor: controller.passwordError.isEmpty
                        ? AppColor.kblack20
                        : AppColor.kSecondaryRed,
                    labelColor: controller.passwordError.isEmpty
                        ? AppColor.kblack40
                        : AppColor.kSecondaryRed,
                    label: 'Confirm password',
                    hintText: 'Confirm your Password',
                    onChanged: (value) {
                      controller.validatePassword(value);
                    },
                    onSaved: (newValue) {
                      controller.password = newValue;
                    },
                  ),
                  const Spacer(
                  
                  ),

                  PrimaryButton(
                    isloading: controller.loading,
                    onPressed: () {
                      controller.login();
                    },
                    buttonText: 'Sign up',
                  ),
                  const Spacer(
                    flex: 2,
                  
                  ),
                  SpanText(
                    text: 'Already have account?',
                    buttonText: 'Login',
                    onTap: () {},
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

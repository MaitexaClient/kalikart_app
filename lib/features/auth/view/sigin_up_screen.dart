import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/utils/keys.dart';
import 'package:kalicart/common/widgets/custom_text_field.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/auth/controller/auth_controller.dart';
import 'package:kalicart/features/auth/widgets/head_text.dart';
import 'package:kalicart/features/auth/widgets/span_text.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    context.read<AuthController>().registrationFormKey = GlobalKey<FormState>();
    return Scaffold(
    
      bottomSheet: Container(
        color: AppColor.kWhiteColor,
        height: 30,
        child: Center(
          child: SpanText(
            text: 'Already have account?',
            buttonText: 'Login',
            onTap: () {
              Navigator.pushReplacementNamed(context, RouteName.loginScreen);
            },
          ),
        ),
      ),
      body: Form(
        key: context.read<AuthController>().registrationFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Consumer<AuthController>(
                builder: (context, controller, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  const HeadText(
                    title: 'Sign Up',
                    subTitle:
                        'Sit amet consectetur adipiscing elit duis tristique sollicitudin',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //name text field
                  CustomTextField(
                    label: 'Name',
                    borderColor: AppColor.kblack20,
                    hintText: 'Enter your name',
                    labelColor: AppColor.kblack40,
                    onChanged: (value) {},
                    onSaved: (newValue) {
                      controller.name = newValue;
                    },
                  ),
                  
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(height: 20),

                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    borderColor: controller.phoneError.isEmpty
                        ? AppColor.kblack20
                        : AppColor.kSecondaryRed,
                    labelColor: controller.phoneError.isEmpty
                        ? AppColor.kblack40
                        : AppColor.kSecondaryRed,
                    label: 'phone',
                    hintText: 'Enter your Phone number',
                    onChanged: (value) {
                      controller.validatePhone(value);
                    },
                    onSaved: (newValue) {
                      controller.phone = newValue;
                    },
                  ),

                  controller.phoneError.isEmpty
                      ? const SizedBox.shrink()
                      : RegularTextStyle(
                          size: 14.sp,
                          text: controller.phoneError,
                          color: AppColor.kSecondaryRed,
                        ),

                    SizedBox(height: 20,),
      
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
                    onSaved: (newValue) {},
                  ),
                  controller.passwordError.isEmpty
                      ? const SizedBox.shrink()
                      : RegularTextStyle(
                          size: 14.sp,
                          text: controller.passwordError,
                          color: AppColor.kSecondaryRed,
                        ),
      
                
      
                  const SizedBox(height: 20),
      
                  //confirm text field
                  CustomTextField(
                    borderColor: controller.confirmPasswordError.isEmpty
                        ? AppColor.kblack20
                        : AppColor.kSecondaryRed,
                    labelColor: controller.confirmPasswordError.isEmpty
                        ? AppColor.kblack40
                        : AppColor.kSecondaryRed,
                    label: 'Confirm password',
                    hintText: 'Confirm your Password',
                    onChanged: (value) {
                      controller.ismatchPassword(value);
                    },
                    onSaved: (newValue) {
                      controller.password = newValue;
                    },
                  ),
      
                  controller.confirmPasswordError.isEmpty
                      ? const SizedBox.shrink()
                      : RegularTextStyle(
                          size: 14.sp,
                          text: controller.confirmPasswordError,
                          color: AppColor.kSecondaryRed,
                        ),
                   SizedBox(
                    height: 50.h,
                  ),
      
                  PrimaryButton(
                    isloading: controller.loading,
                    onPressed: () {
                      controller.signUp(context);
                    },
                    buttonText: 'Sign up',
                  ),
                ],
              )
           
           ,
              ),
          ),
        ),
      ),
    );
  }
}

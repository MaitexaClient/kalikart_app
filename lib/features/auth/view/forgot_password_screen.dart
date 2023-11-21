import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_text_field.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/features/auth/widgets/head_text.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const HeadText(
              title: 'Login',
              subTitle:
                  'Sit amet consectetur adipiscing elit duis tristique sollicitudin',
            ),
            SizedBox(
              height: 60.h,
            ),
            //emil text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                label: 'Email',
                borderColor: AppColor.kblack20,
                hintText: 'Enter your email',
                labelColor: AppColor.kblack40,
                onChanged: (value) {},
                onSaved: (newValue) {},
              ),
            ),
            const Spacer(flex: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(onPressed: () {
                
              }, buttonText: 'Submit'),
            ),
           const  SizedBox(height: 20,)
        ],
        ),
      ),
    );
  }
}

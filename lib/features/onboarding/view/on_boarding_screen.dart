import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFfedbcf),
        body: Column(
          children: [
             Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child:const Image(
                    image: AssetImage(
                        'assets/images/happy-excited-young-woman-with-dark-hair-opened-mouth-gray-tshirt-looks-amazed-using-pointing-mobile-phone-yellow-wall-transformed 1.png',
                        ),
                        
                        ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.r),
                      topRight: Radius.circular(35.r))),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: BoldTextStyle(
                        align: TextAlign.center,
                        size: 28.sp,
                        text: 'Find the best price of food'),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: RegularTextStyle(
                      textAlign: TextAlign.center,
                      size: 16.sp,
                      text: 'There are many kind of food available here',
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  PrimaryButton(onPressed: () {
                   Navigator.pushReplacementNamed(context, RouteName.loginScreen);
                  }, buttonText: 'start'),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

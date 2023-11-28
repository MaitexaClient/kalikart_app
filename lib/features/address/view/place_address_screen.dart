import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class PlaceAddressScreen extends StatefulWidget {
  const PlaceAddressScreen({super.key});

  @override
  State<PlaceAddressScreen> createState() => _PlaceAddressScreenState();
}

class _PlaceAddressScreenState extends State<PlaceAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'My Addresses'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/address.png'),
              radius: 50,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BoldTextStyle(size: 20.sp, text: 'Your Address Yet!'),
          const SizedBox(
            height: 17,
          ),
          RegularTextStyle(
              size: 16.sp,
              text: 'Add your address and lets get\n         '
                  '                      started'),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: const BorderSide(color: AppColor.kGreenColor)),
              onPressed: () {},
              child: BoldTextStyle(
                size: 18.sp,
                color: AppColor.kGreenColor,
                text: 'Add Address',
              ))
        ],
      ),
    );
  }
}

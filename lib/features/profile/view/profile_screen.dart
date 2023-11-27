import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/profile/widget/custom_tile_widgwt.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Profile'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: AppColor.kGreenColor,
              radius: 50,
            ),
            SemiBoldTextStyle(size: 18.sp, text: 'Name'),
            RegularTextStyle(size: 16.sp, text: 'lesliealexander@gmail.com'),

            const Spacer(),
            //profile
            CustomTileWidget(
              tileText: 'profile',
              icon: Icons.person_outline,
              onTap: () {},
            ),
            //address
            CustomTileWidget(
              tileText: 'My Addresses',
              icon: Icons.place_outlined,
              onTap: () {},
            ),
            //wallet
            CustomTileWidget(
              tileText: 'My Wallet',
              icon: Icons.account_balance_outlined,
              onTap: () {},
            ),

            
            const Spacer(),
            CustomTileWidget(
              tileText: 'Log out',
              icon: Icons.logout_outlined,
              isLogout: true,
              onTap: () {},
            ),


          ],
        ),
      ),
    );
  }
}

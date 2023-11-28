import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/features/profile/widget/custom_edittext_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'My Profile'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: const CircleAvatar(
                      backgroundColor: AppColor.kGreenColor,
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 50),
                  CustomEditTextField(labelText: 'Email'),
                  SizedBox(height: 20),
                  CustomEditTextField(labelText: 'Name'),
                  SizedBox(height: 20),
                  CustomEditTextField(labelText: 'PhoneNumber'),
                  Spacer(), // Spacing to push button to the bottom
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: PrimaryButton(
              onPressed: () {
                // Add functionality for the button here
              },
              buttonText: 'Edit Profile',
            ),
          ),
        ],
      ),
    );
  }
}

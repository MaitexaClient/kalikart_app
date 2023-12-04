import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/profile/controller/profile_controller.dart';
import 'package:kalicart/features/profile/widget/custom_edittext_widget.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<ProfileController>(context, listen: false).getProfile(context);
    // });

    final data = Provider.of<ProfileController>(context, listen: false).profile;

    emailController.text = data?.email ?? 'email';
    nameController.text = data?.name ?? 'name';
    phoneController.text = data?.phone ?? 'phone';

    super.initState();
  }

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
      body: Consumer<ProfileController>(builder: (context, controller, child) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: CircleAvatar(
                        backgroundColor: AppColor.kGreenColor,
                        radius: 50,
                      ),
                    ),
                    SemiBoldTextStyle(
                        size: 18.sp,
                        text: controller.profile?.name ?? 'name'),
                    RegularTextStyle(
                        size: 16.sp,
                        text: controller.profile?.email ?? 'email'),
                    const SizedBox(height: 50),
                    CustomEditTextField(
                      labelText: 'Email',
                      textEditingController: emailController,
                      isEnabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomEditTextField(
                      labelText: 'Name',
                      textEditingController: nameController,
                      isEnabled: false,
                    ),
                    const SizedBox(height: 20),
                    CustomEditTextField(
                      labelText: 'PhoneNumber',
                      isEnabled: false,
                      textEditingController: phoneController,
                    ),
                    const Spacer(), // Spacing to push button to the bottom
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
        );
      }),
    );
  }
}

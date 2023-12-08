import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/profile/controller/profile_controller.dart';
import 'package:kalicart/features/profile/widget/custom_edittext_widget.dart';
import 'package:provider/provider.dart';

class SaveProfileScreen extends StatefulWidget {
  const SaveProfileScreen({super.key});

  @override
  State<SaveProfileScreen> createState() => _SaveProfileScreenState();
}

class _SaveProfileScreenState extends State<SaveProfileScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    final data = Provider.of<ProfileController>(context, listen: false).profile;

    emailController.text = data?.email ?? 'email';
    nameController.text = data?.name ?? 'name';
    phoneController.text = data?.phone ?? 'phone';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'My Profile'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<ProfileController>(builder: (context, controller, child) {
        return controller.loading ? Center(child: CircularProgressIndicator(color: AppColor.kGreenColor,),)  : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Stack(
                        children: [
                          controller.image == null
                              ? CircleAvatar(
                                  backgroundColor: AppColor.kGreenColor,
                                  radius: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: controller.profile?.image != null
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                controller.profile!.image!,
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                const CircularProgressIndicator(
                                              color: AppColor.kWhiteColor,
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Image(
                                                    image: AssetImage(
                                                        'assets/images/profile.jpg')),
                                          )
                                        : const Image(
                                            image: AssetImage(
                                                'assets/images/profile.jpg')),
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: AppColor.kGreenColor,
                                  radius: 50,
                                  backgroundImage: FileImage(controller.image!),
                                  ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  _showBottomModal(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.kWhiteColor,
                                      border: Border.all(
                                          color: AppColor.kGreenColor)),
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    size: 17,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    SemiBoldTextStyle(
                        size: 18.sp, text: controller.profile?.name ?? 'name'),
                    RegularTextStyle(
                        size: 16.sp,
                        text: controller.profile?.email ?? 'email'),
                    const SizedBox(height: 50),
                    CustomEditTextField(
                      labelText: 'Email',
                      textEditingController: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomEditTextField(
                      labelText: 'Name',
                      textEditingController: nameController,
                    ),
                    const SizedBox(height: 20),
                    CustomEditTextField(
                      labelText: 'PhoneNumber',
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
                onPressed: () async {

                  
                   controller.updateProfile(
                    context,
                      name: nameController.text == ''
                          ? null
                          : nameController.text,
                      email: emailController.text == ''
                          ? null
                          : emailController.text,
                      phone: phoneController.text == ''
                          ? null
                          : phoneController.text,
                      image: controller.image
                          );
                },
                buttonText: 'Save Profile',
              ),
            ),
          ],
        );
      }),
    );
  }
}

// Function to show the bottom modal
void _showBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Consumer<ProfileController>(builder: (context, controller, child) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16.0),
              PrimaryButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await controller.takeImage(imageSource: ImageSource.gallery);
                },
                buttonText: 'Gallary',
              ),
              const SizedBox(height: 30.0),
              PrimaryButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await controller.takeImage(imageSource: ImageSource.camera);
                  },
                  buttonText: 'Camera'),
              const SizedBox(height: 30.0),
            ],
          ),
        );
      });
    },
  );
}


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
      body: Consumer<ProfileController>(
        builder: (context,controller,child) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                       Center(
                        child:  Stack(
                          children: [
                            const  CircleAvatar(
                              backgroundColor: AppColor.kGreenColor,
                              radius: 50,
                            ),
                            Positioned(
                            
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async{

                                 await controller.takeImage(imageSource: ImageSource.camera);

                                },
                                child: Container(
                                  height: 35,
                                  width: 35, 
                                  decoration:   BoxDecoration(
                                    shape: BoxShape.circle,
                                         color: AppColor.kWhiteColor,
                                    border: Border.all(
                                     color: AppColor.kGreenColor 
                                    )
                                  ),
                                                         
                                  child: const Icon(Icons.add_a_photo,size: 17,),),
                              ) )
                          ],
                        ),
                      ),
                      SemiBoldTextStyle(
                            size: 18.sp,
                            text: controller.profile?.name ?? 'name'),
                        RegularTextStyle(
                            size: 16.sp,
                            text: controller.profile?.email ?? 'email'),
                       const SizedBox(height: 50),
                       CustomEditTextField(labelText: 'Email'  ,textEditingController: emailController,),
                       const  SizedBox(height: 20),
                       CustomEditTextField(labelText: 'Name',textEditingController: nameController,),
                       const SizedBox(height: 20),
                       CustomEditTextField(labelText: 'PhoneNumber' ,textEditingController: phoneController,),
                      const  Spacer(), // Spacing to push button to the bottom
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: PrimaryButton(
                  onPressed: () {

                    controller.updateProfile(
                      name: nameController.text == '' ? null : nameController.text,
                      email:  emailController.text == '' ? null : emailController.text,
                      phone: phoneController.text == '' ? null :phoneController.text
                      
                    );
                     
                  },
                  buttonText: 'Save Profile',
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/profile/controller/profile_controller.dart';
import 'package:kalicart/features/profile/view/profile_details_screen.dart';
import 'package:kalicart/features/profile/widget/custom_tile_widgwt.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileController>(context, listen: false)
          .getProfile(context);
    });
    super.initState();
  }

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
        child:
            Consumer<ProfileController>(builder: (context, controller, child) {
          return controller.loading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColor.kGreenColor),
                )
              : Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.kGreenColor,
                      radius: 50,
                      backgroundImage: controller.profile?.image != null
                          ? NetworkImage(controller.profile!.image!)
                          : null,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: controller.profile?.image != null
                            ? CachedNetworkImage(
                                imageUrl: controller.profile!.image!,
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        const CircularProgressIndicator(
                                  color: AppColor.kWhiteColor,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                        image: AssetImage(
                                            'assets/images/profile.jpg')),
                              )
                            : const Image(
                                image: AssetImage('assets/images/profile.jpg')),
                      ),
                    ),

                    SemiBoldTextStyle(
                        size: 18.sp, text: controller.profile?.name ?? 'name'),
                    RegularTextStyle(
                        size: 16.sp,
                        text: controller.profile?.email ?? 'email'),

                    const Spacer(),
                    //profile
                    CustomTileWidget(
                      tileText: 'profile',
                      icon: Icons.person_outline,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                    //address
                    CustomTileWidget(
                      tileText: 'My Addresses',
                      icon: Icons.place_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.addressScreen);
                      },
                    ),
                    //wallet
                    CustomTileWidget(
                      tileText: 'My Wallet',
                      icon: Icons.account_balance_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.walletScreen);
                      },
                    ),

                    const Spacer(),
                    CustomTileWidget(
                      tileText: 'Log out',
                      icon: Icons.logout_outlined,
                      isLogout: true,
                      onTap: () {
                        controller.logout(context);
                      },
                    ),
                  ],
                );
        }),
      ),
    );
  }
}

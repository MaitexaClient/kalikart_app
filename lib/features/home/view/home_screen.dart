import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/common/widgets/row_text_widget.dart';
import 'package:kalicart/common/widgets/web_view.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:kalicart/features/home/widgets/category_list_widget.dart';
import 'package:kalicart/features/home/widgets/exclusive_deals_widget.dart';
import 'package:kalicart/features/home/widgets/trending_product_widget.dart';
import 'package:kalicart/features/home/widgets/video_banners.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:kalicart/features/profile/view/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).initial(context);
      Provider.of<ProductDetailsController>(context, listen: false)
          .getAllFavourite(context: context);

      Provider.of<HomeController>(context, listen: false)
          .checkLocationPermission();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeController>(builder: (context, controller, child) {
        return SafeArea(
          child: controller.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.kGreenColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SemiBoldTextStyle(
                                size: 14.sp,
                                text: controller.location ?? 'Location',
                                color: AppColor.kblack,
                              ),
                              const Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileScreen(),
                                        ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColor.kGray, width: 2),
                                    ),
                                    child: const FaIcon(
                                      FontAwesomeIcons.user,
                                      color: AppColor.kblack40,
                                      size: 20,
                                    ),
                                  ))
                            ],
                          ),

                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.kGray),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              'Logo',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 10),
                            )),
                          ),

                          //curosel slider
                          Container(
                            height: 230.h,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.amber),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true, viewportFraction: 1),
                              items: controller.bannerImages.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const WebViewStack(
                                              url: 'https://www.flipkart.com/',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(i.image!),
                                                  fit: BoxFit.cover,
                                                  ),
                                                  ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 30.w),
                                          )),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          )

                          //category
                          ,
                          RowTextWidget(
                            leadText: 'Categories',
                            actionText: '',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.categoryScreen);
                            },
                          ),

                          //category list
                          CategoryListWidget(),

                         

                          RowTextWidget(
                            leadText: 'Earn your reward',
                            actionText: '',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.trendingScreen);
                            },
                          ),

                          VideoBannerWidget(
                            videoBannerList: controller.bannerVideos,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          //Exclusive deals
                          RowTextWidget(
                            leadText: 'Exclusive Deals For you',
                            actionText: '',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.trendingScreen);
                            },
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 320.h,
                            child: ExclusiveWidget(),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          //video banner
                          RowTextWidget(
                            leadText: 'Earn your reward',
                            actionText: '',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.trendingScreen);
                            },
                          ),

                          VideoBannerWidget(
                            videoBannerList: controller.bannerVideos,
                          ),

                          RowTextWidget(
                            leadText: 'Trending',
                            actionText: '',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.trendingScreen);
                            },
                          ),
                          //trending product
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 300.h,
                              child: TrendingProductWidget()),

                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
        );
      }),
    );
  }
}

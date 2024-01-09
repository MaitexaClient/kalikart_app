import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/card_column_widget.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/common/widgets/row_text_widget.dart';
import 'package:kalicart/common/widgets/web_view.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                                text: 'Location',
                                color: AppColor.kblack,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.searchScreen);
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.magnifyingGlass,
                                  color: AppColor.kblack40,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          //curosel slider
                          Container(
                            height: 165.h,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true, viewportFraction: 1),
                              items: controller.bannerImages.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewStack(
                                          url: 'https://www.flipkart.com/',
                                        ),),);
       
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(i.image!),
                                                  fit: BoxFit.cover)),
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
                            actionText: 'View all',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.categoryScreen);
                            },
                          ),
                          //category

                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150.h,
                            child: controller.categoryList.isEmpty
                                ? const Center(
                                    child: Text('No category found'),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.categoryList.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: CardColumnWidget(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RouteName.productListScreen,
                                              arguments: {
                                                'catName': controller
                                                    .categoryList[index]
                                                    .category,
                                                'catId': controller
                                                    .categoryList[index].sId
                                              });
                                        },
                                        image: controller
                                                .categoryList[index].image ??
                                            '',
                                        text: controller
                                            .categoryList[index].category!,
                                      ),
                                    ),
                                  ),
                          ),
                          //banner 2

                          Container(
                            height: 165.h,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true, viewportFraction: 1),
                              items: controller.bannerVideos.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteName.videoScreener,
                                            arguments: {
                                              'url': i.video!,
                                              'bannerId': i.sId,
                                            });
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      i.thumbNail!),
                                                  fit: BoxFit.cover)),
                                          child: Stack(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: const Icon(
                                                  Icons.play_circle_outline,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: 0,
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.5,
                                                  child: PrimaryButton(
                                                    onPressed: () {},
                                                    buttonText: 'Earn now',
                                                    height: 40.h,
                                                    buttonTextSize: 14.sp,
                                                    radius: 3,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),

                          RowTextWidget(
                            leadText: 'Trending',
                            actionText: 'View all',
                            action: () {
                              Navigator.pushNamed(
                                  context, RouteName.trendingScreen);
                            },
                          ),

                          //trending product
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 250.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.trendingList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Consumer<ProductDetailsController>(
                                    builder:
                                        (context, productController, child) {
                                  return ProductCard(
                                    images: controller
                                        .trendingList[index].image![0]
                                        .toString(),
                                    catName: controller
                                            .trendingList[index].subCategory ??
                                        '',
                                    price: controller.trendingList[index].price
                                        .toString(),
                                    productName: controller
                                        .trendingList[index].productName
                                        .toString(),
                                    productId:
                                        controller.trendingList[index].sId,
                                    isFavarated:
                                        productController.checkFaviorite(
                                            productId: controller
                                                .trendingList[index].sId!),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteName.productDeatailsScreen,
                                          arguments: controller
                                              .trendingList[index].sId
                                              .toString());
                                    },
                                  );
                                }),
                              ),
                            ),
                          ),

                          //banner3
                          Container(
                            height: 165.h,
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.amber),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true, viewportFraction: 1),
                              items: controller.bannerVideos.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteName.videoScreener,
                                            arguments: {
                                              'url': i.video!,
                                              'bannerId': i.sId,
                                            });
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      i.thumbNail!),
                                                  fit: BoxFit.cover)),
                                          child: Stack(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: const Icon(
                                                  Icons.play_circle_outline,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: 0,
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.5,
                                                  child: PrimaryButton(
                                                    onPressed: () {},
                                                    buttonText: 'Earn now',
                                                    height: 40.h,
                                                    buttonTextSize: 14.sp,
                                                    radius: 3,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )),
                ),
        );
      }),
    );
  }
}

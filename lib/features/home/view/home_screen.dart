import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/card_column_widget.dart';
import 'package:kalicart/common/widgets/medium_text.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/common/widgets/row_text_widget.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
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
       Provider.of<HomeController>(context,listen: false).initial(context);
  
});
    
  

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Consumer<HomeController>(
              builder: (context,controller,child) {
                return  controller.loading ? Center(child: CircularProgressIndicator(color: AppColor.kGreenColor,),)  :Column(
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
                          text: 'location',
                          color: AppColor.kblack,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.searchScreen);
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
                        options:
                            CarouselOptions(autoPlay: true, viewportFraction: 1),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/black-friday-elements-assortment.jpg'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumTextStyle(
                                            size: 15.sp, text: 'Fastbey'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        BoldTextStyle(size: 22.sp, text: 'Combo'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width /
                                              3.5,
                                          child: PrimaryButton(
                                            onPressed: () {},
                                            buttonText: 'Order now',
                                            height: 45.h,
                                            buttonTextSize: 14.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
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
                        Navigator.pushNamed(context, RouteName.categoryScreen);
                      },
                    ),
                    //category

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 150.h,
                      child: controller.categoryList.isEmpty ? const Center(
                        child: Text('No category found'),
                      )  :ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:  controller.categoryList.length,
                        itemBuilder: (context, index) =>  Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CardColumnWidget(
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.productListScreen ,arguments: 'hi');
                              
                            },
                            image:controller.categoryList[index].image ?? '',
                            text: controller.categoryList[index].category!,
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
                        options:
                            CarouselOptions(autoPlay: true, viewportFraction: 1),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/black-friday-elements-assortment.jpg'),
                                          fit: BoxFit.cover)),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        MediumTextStyle(
                                            size: 15.sp, text: 'Fastbey'),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        BoldTextStyle(size: 22.sp, text: 'Combo'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width /
                                              3.5,
                                          child: PrimaryButton(
                                            onPressed: () {},
                                            buttonText: 'Order now',
                                            height: 45.h,
                                            buttonTextSize: 14.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),

                    RowTextWidget(
                      leadText: 'Trending',
                      actionText: 'View all',
                      action: () {
                        Navigator.pushNamed(context, RouteName.trendingScreen);
                      },
                    ),

                    //trending product
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: ProductCard(onPressed: () {
                            Navigator.pushNamed(context, RouteName.productDeatailsScreen);
                            
                          },),
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

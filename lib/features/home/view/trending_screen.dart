import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:provider/provider.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeController>(context, listen: false).getAllTrending(context);
     
    
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
        title: BoldTextStyle(size: 20.sp, text: 'Trending'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<HomeController>(
        builder: (context,controller,child) {
          return controller.loading ? const Center(child: CircularProgressIndicator(color: AppColor.kGreenColor),)  :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: controller.trendingList.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.productDeatailsScreen,arguments: controller.trendingList[index].sId.toString());
                  },
                  child:  RowProductCard(
                    image: controller.trendingList[index].image![0] ?? '',
                    categoryName: controller.trendingList[index].subCategory ?? 'category name',
                    price: controller.trendingList[index].price.toString(),
                    productName: controller.trendingList[index].productName,


                  )),
              ),
            ),
          );
        }
      ),
    );
  }
}


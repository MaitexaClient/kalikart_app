import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteName.productDeatailsScreen);
              },
              child: const RowProductCard()),
          ),
        ),
      ),
    );
  }
}


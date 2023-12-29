import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/medium_text.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrackerScreen extends StatefulWidget {
  const OrderTrackerScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackerScreen> createState() => _OrderTrackerScreenState();
}

class _OrderTrackerScreenState extends State<OrderTrackerScreen> {

  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const  IconThemeData(color: AppColor.kblack),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: BoldTextStyle(size: 20.sp, text: 'Order details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoldTextStyle(size: 16.sp, text: 'Address'),
            const SizedBox(height: 20,),

            Container(
              width: MediaQuery.of(context).size.width,
              padding:  EdgeInsets.symmetric(vertical: 30.h ,horizontal: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.kGray),
                
                borderRadius: BorderRadius.circular(15.r)
              ),
              
              child: RegularTextStyle(size: 16.sp, text: 'address'),

            ),
            const SizedBox(height: 20,),

            OrderTracker(
              status: Status.delivered,
              activeColor: Colors.green,
              inActiveColor: Colors.grey[300],
              orderTitleAndDateList: orderList,
              shippedTitleAndDateList: shippedList,
              outOfDeliveryTitleAndDateList: outOfDeliveryList,
              deliveredTitleAndDateList: deliveredList,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/models/order_model.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';

class ActiveOrderListWidget extends StatelessWidget {
  const ActiveOrderListWidget({super.key,required this.orderList});

  final List<OrderModel> orderList;

  @override
  Widget build(BuildContext context) {
    print(orderList.length);
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Stack(
          children: [
             RowProductCard(
              productName: orderList[index].name,

            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: TextButton(onPressed: () {
                
              }, child: SemiBoldTextStyle(size: 14.sp,text: 'Track Order >',color: AppColor.kGreenColor,)),
            )
          ],
        ),
      ),
    );
  }
}

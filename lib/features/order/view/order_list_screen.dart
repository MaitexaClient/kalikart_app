import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/list_empty_widget.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/order/controller/order_controller.dart';
import 'package:kalicart/features/order/widgets/active_order_widget.dart';
import 'package:kalicart/features/order/widgets/completed_order_widget.dart';
import 'package:provider/provider.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderController>(context, listen: false).getAllOrder(context:context);
    });


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Order'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Consumer<OrderController>(
          builder: (context, controller, child) => controller.loading ?  const Center(
            child: CircularProgressIndicator(color: AppColor.kGreenColor,),
          ) :
          
          controller.orderList.isEmpty
              ? Center(
                  child: ListEmptyWidget(
                    title: 'No  Order Yet!',
                    buttonText: 'Go To Shop',
                    onTap: () {},
                  ),
                )
              : DefaultTabController(
                  length: 2,
                  animationDuration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(5),
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: AppColor.kLightGray,
                            borderRadius: BorderRadius.circular(15)),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: AppColor.kWhiteColor,
                              borderRadius: BorderRadius.circular(15)),
                          labelColor: AppColor.kblack,
                          unselectedLabelColor: AppColor.kblack40,
                          tabs: const [
                            Tab(text: 'Active'),
                            Tab(text: 'Completed'),
                          ],
                        ),
                      ),

                       Expanded(child: TabBarView(
                        children: [
                          ActiveOrderListWidget(orderList: controller.orderList,),
                          CompletedOrderListWidget()
                        ],
                      ))


                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/checkout/controller/check_out_controller.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Cart'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CheckOutController>(
        builder:(context, value, child) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              SemiBoldTextStyle(size: 18.sp, text: 'Shipping Address'),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 6,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldTextStyle(size: 15.sp, text: 'Home'),
                         const SizedBox(height: 5,),
                        RegularTextStyle(
                            size: 14.sp,
                            text:
                                '4517 Washington Ave. Manchester, Kentucky 39495')
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.edit,
                    size: 18,
                  )
                ],
              ),
              const SizedBox(height: 20,),
              SemiBoldTextStyle(size: 18.sp, text: 'Order list'),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartController?.allCartData?.cartProducts?.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const RowProductCard()),
                ),
              ),
              PrimaryButton(onPressed: () {
      
                Navigator.pushNamed(context, RouteName.confirmScreen);
                
              }, buttonText: 'Confirm')
          ],
          ),
        ),
      ),
    );
  }
}

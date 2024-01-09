import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/row_product_card.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/common/widgets/text_semi_bold.dart';
import 'package:kalicart/features/cart/widget/sub_row_text_widget.dart';
import 'package:kalicart/features/checkout/controller/check_out_controller.dart';
import 'package:kalicart/features/payment/controller/payment_controller.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CheckOutController>(context, listen: false)
          .getAddress(context: context);
      Provider.of<PaymentController>(context, listen: false).initial(context);
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
        title: BoldTextStyle(size: 20.sp, text: 'Confirim'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CheckOutController>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: value.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.kGreenColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SemiBoldTextStyle(size: 18.sp, text: 'Shipping Address'),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldTextStyle(
                                  size: 15.sp,
                                  text: value.primaryAddress?.name ?? 'home'),
                              const SizedBox(
                                height: 5,
                              ),
                              RegularTextStyle(
                                  size: 14.sp,
                                  text: value.primaryAddress?.address ??
                                      'address')
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.addressScreen);
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      
                    ),
                    SemiBoldTextStyle(size: 18.sp, text: 'Order list'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value
                            .cartController?.allCartData?.cartProducts?.length,
                        itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: RowProductCard(
                              productName: value.cartController?.allCartData
                                  ?.cartProducts?[index].productName,
                              image: value.cartController?.allCartData
                                  ?.cartProducts?[index].image,
                              categoryName: value.cartController?.allCartData
                                  ?.cartProducts?[index].subCategory,
                              price: value.cartController?.allCartData
                                  ?.cartProducts?[index].price
                                  .toString(),
                            ))
                      ),
                    ),
                     SubRowTextWidget(
                                prfixText: 'total',
                                suffixText: '${value.cartController?.allCartData?.total!}',
                              ),
                              const Divider(
                                thickness: 1,
                                color: AppColor.kGray,
                              ),
                              const SubRowTextWidget(
                                prfixText: 'offer',
                                suffixText: '0',
                              ),
                              const Divider(
                                thickness: 1,
                                color: AppColor.kGray,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SemiBoldTextStyle(size: 18.sp, text: 'Total'),
                                  SemiBoldTextStyle(
                                      size: 18.sp,
                                      text:'₹${value.cartController?.allCartData?.total}'),
                                ],
                              ),
                    PrimaryButton(
                      onPressed: () async {
                        //payment confirmation

                        await context.read<PaymentController>().createOrder(
                              amount: value.cartController!.allCartData!.total!
                                  .toDouble(),
                              context: context,
                            );

                        //confirm
                        if (context.mounted) {
                          context.read<CheckOutController>().updateOrder(
                              context: context,
                              addressId: value.primaryAddress!.sId!,

                              );
                        }
                      },
                      buttonText: 'Confirm',
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

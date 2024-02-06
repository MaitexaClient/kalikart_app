import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/custom_outlined_button.dart';
import 'package:kalicart/common/widgets/loading_indicator.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:kalicart/features/product/view/product_details_screen_new.dart';
import 'package:kalicart/features/search/view/search_screen.dart';
import 'package:provider/provider.dart';

class ProductListNew extends StatefulWidget {
  const ProductListNew({Key? key, required this.name, required this.catId})
      : super(key: key);

  final String catId;

  final String? name;

  @override
  State<ProductListNew> createState() => _ProductListNewState();
}

class _ProductListNewState extends State<ProductListNew> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      Provider.of<ProductDetailsController>(context, listen: false)
          .getAllProductByCat(context, widget.catId);
    });

    super.initState();
  }

  List trendingList = [
    'https://www.seekpng.com/png/full/377-3771491_doritos-png-doritos-transparent-png-2012-pepsico-annual.png',
    'https://www.seekpng.com/png/full/375-3750834_tecate-buscar-ms-consumidores-con-nueva-imagen-tecate.png',
    'https://www.seekpng.com/png/full/115-1158032_variety-box-seasoned-nuts-4oz-4-pack-nuts.png',
    'https://www.seekpng.com/png/full/115-1158910_sierra-nevada-southern-hemisphere-hop-pack-12pk-cans.png',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int? check;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductDetailsController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: AppColor.kblack),
        centerTitle: true,
        title: Text(
          widget.name ?? 'category',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kGray,
                  border: Border.all(color: Colors.grey)),
              child: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.productList.length,
        itemBuilder: (context, index) {
          var customOutlineButton = CustomOutlineButton(
            onPressed: () {
              check = index;
              controller.addCart(
                  productId: controller.productList[index].sId!,
                  price: controller.productList[index].price!.toString(),
                  context: context);
            },
          );
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreenNew(
                    productId: controller.productList[index].sId!,
                    title: "Honey: Nature's Sweet Elixir",
                    quantity: '1 L',
                    price: '₹80',
                    brandName: 'brand name',
                    discountedPrice: '₹180',
                    imageUrl: trendingList[index],
                    productTitle: "Honey: Nature's Sweet Elixir",
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.kGray),
                  borderRadius: BorderRadius.circular(0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: controller.productList[index].image![0],
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.kGreenColor,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 15, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const RegularTextStyle(
                              size: 13, text: 'Dukes', color: Colors.black54),
                          const SizedBox(
                            height: 5,
                          ),
                          const SizedBox(
                            width: 120,
                            child: Text(
                              "Honey: Nature's Sweet Elixir",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '₹80',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 3),
                                  ),
                                  Text(
                                    '₹180',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.kblack,
                                      decorationThickness: 3,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.kLightGray,
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: controller.loading
                                      ? check == index
                                          ? const LoadingIndicator()
                                          : customOutlineButton
                                      : customOutlineButton,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
        ),
      ),
    );
  }
}

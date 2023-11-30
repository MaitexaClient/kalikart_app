import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/product_card_widget.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/search/controllers/search_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Search'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.kGray),
                borderRadius: BorderRadius.circular(20.r)),
            child: TextField(
              onChanged: (value) {
                Provider.of<SearchScreenController>(context, listen: false).getfilterProducts(context, searchQuery: value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon:  FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: AppColor.kblack40,
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Consumer<SearchScreenController>(
                builder: (context, searchController, _) {
                  return searchController.loading ? const Center(child: CircularProgressIndicator(color: AppColor.kGreenColor,),)  :
                  
                   GridView.builder(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: .7,
                    ),
                    itemCount: searchController.filteredProducts.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                            ProductCard(
                              images: 'https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg',
                              catName: searchController.filteredProducts[index].subCategory??'product name',
                              price: searchController.filteredProducts[index].price.toString(),
                              productName:  searchController.filteredProducts[index].productName??'product name',
                              onPressed: () {

                             // Navigator.pushNamed(context, RouteName.productDeatailsScreen);
                            
                          },),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                            icon: Container(
                              height: 25,
                              width: 25,
                              decoration: const  BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.kblack
                              ),
                              child: const Icon(Icons.favorite_outline,color: AppColor.kWhiteColor,size: 16,),
                            ),
                            onPressed: () {
                              
                            },
                          ))
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

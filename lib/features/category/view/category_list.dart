import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/card_column_widget.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/category/controller/category_controller.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryController>(context, listen: false).getCategoryList(context);
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
        title: BoldTextStyle(size: 20.sp, text: 'Categories'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Consumer<CategoryController>(
          builder: (context, controller, child) {
            return controller.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kGreenColor,
                    ),
                  )
                : Row(
                    children: [
                      NavigationRail(
                          labelType: NavigationRailLabelType.selected,
                          useIndicator: true,
                          elevation: 1,
                          indicatorColor: AppColor.kWhiteColor,

                          //indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onDestinationSelected: (value) {
                            controller.changePage(value, context,
                                catId: controller.categoryList[value].sId!);
                          },
                          destinations: controller.categoryList
                              .map(
                                (e) => NavigationRailDestination(
                                  selectedIcon: RegularTextStyle(
                                    size: 14.sp,
                                    text: e.category ?? 'category name',
                                    color: AppColor.kGreenColor.withOpacity(.5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  icon: RegularTextStyle(
                                    size: 14.sp,
                                    text: e.category ?? 'categoryname',
                                  ),
                                  label: const SizedBox(),
                                ),
                              )
                              .toList(),
                          selectedIndex: controller.selectedIndex),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // Number of columns
                                  crossAxisSpacing:
                                      8.0, // Spacing between columns
                                  mainAxisSpacing: 8.0, // Spacing between rows
                                  childAspectRatio: .8),
                          itemBuilder: (BuildContext context, int index) {
                            // Use the index to create your item
                            return CardColumnWidget(
                              onTap: () {
                                Navigator.pushNamed(context,RouteName.productListSubCatScreen,arguments:controller.subCatList[index].toString() );
                                    
                              },
                              image:
                                  'https://img.freepik.com/free-photo/portrait-young-handsome-bearded-man_1303-19639.jpg',
                              text: controller.subCatList[index],
                            );
                          },
                          itemCount: controller
                              .subCatList.length, // Number of items in the grid
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/animate_icon.dart';
import 'package:kalicart/common/widgets/card_column_widget.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:kalicart/features/product/view/product_list_new.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({super.key});

  final List<Category> categoryList = [
    Category(
        sId: 'id_',
        category: 'Staples',
        image:
            'https://www.pngall.com/wp-content/uploads/4/Grocery-PNG-Free-Download.png'),
    Category(
        sId: 'id_',
        category: 'Snacks & Beverages',
        image:
            'https://freepngimg.com/thumb/grocery/41619-7-groceries-free-download-image-thumb.png'),
    Category(
      sId: 'id',
      category: 'Packaged Food',
      image:
          'https://freepngimg.com/thumb/grocery/41629-3-groceries-png-download-free-thumb.png',
    ),
    Category(
      sId: 'id',
      category: 'Fasion',
      image:
          'https://png.pngitem.com/pimgs/s/4-41365_transparent-men-fashion-png-model-fashion-png-kids.png',
    ),
    Category(
        sId: 'id',
        category: 'Electronics',
        image:
            'https://png.pngitem.com/pimgs/s/140-1404039_electronics-items-png-consumer-electronics-png-transparent-png.png'),
    Category(
        sId: 'id',
        category: 'Dairy & Eggs',
        image:
            'https://png.pngitem.com/pimgs/s/160-1607864_blue-cheese-hd-png-download.png'),
    Category(
        sId: 'id',
        category: 'Home& Kitchen',
        image:
            'https://png.pngitem.com/pimgs/s/61-612916_transparent-home-appliances-png-home-appliances-png-png.png'),
    Category(
        sId: 'id',
        category: 'Beauty',
        image:
            'https://png.pngitem.com/pimgs/s/38-380342_download-makeup-png-pic-makeup-clipart-transparent-png.png'),
  ];

   

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return controller.categoryList.isEmpty
        ? const Center(
            child: Text('No category found'),
          )
        : GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            crossAxisCount: 4,
              childAspectRatio: 0.60,
              // mainAxisSpacing: 34.h,
              crossAxisSpacing: 14.w,

            
           children: List.generate(controller.gridViewItems().length, (index) => GestureDetector(
                onTap: () {},
                child: CardColumnWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListNew(
                          name: controller.gridViewItems()[index].category,
                          catId: controller.gridViewItems()[index].sId!,
                        ),
                      ),
                    );
                  },
                  image: controller.gridViewItems()[index].image ?? '',
                  text: controller.gridViewItems()[index].category!,
                ),
              )
            
            )..add(
              GestureDetector(
                onTap: () {
                  controller.seeMoreOrLess();
                },
                child: Container(
                  
                           
                          padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                  color: AppColor.kLightGray,
                  borderRadius: BorderRadius.circular(15)),
                   child :        WidgetAnimator(
    atRestEffect: WidgetRestingEffects.wave(),
    child: Icon(
      controller.displayAll ? Icons.keyboard_arrow_up :  Icons.keyboard_arrow_down
    )
  )
              
                          ),
              ),),
          );
  }
}

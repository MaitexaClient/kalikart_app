import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/features/Root/controller/root_controller.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/favourites/view/favourite_screen.dart';
import 'package:kalicart/features/home/view/home_screen.dart';
import 'package:kalicart/features/order/view/order_list_screen.dart';
import 'package:kalicart/features/order/view/order_view_screen.dart';
import 'package:kalicart/features/profile/view/profile_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {

  const RootScreen({super.key});
   
  final List<Widget> _pages = const  [
    HomeScreen(),
    FavouriteScreen(),
    CartListScreen(),
    OrderViewScreen(),
    ProfileScreen(),
  ];

   
  @override
  Widget build(BuildContext context) {
    return Consumer<RootController>(
      builder: (context, value, child) => 
       Scaffold(
        body:_pages[value.currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.kGreenColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: context.read<RootController>().currentIndex,
          onTap: (index) {
           
              context.read<RootController>().setIndex(index);
       
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: ''
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: ''
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: ''
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              activeIcon: Icon(Icons.article),
              label: ''
            
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: ''
            
            ),

            
          ],
        ),
      ),
    );
  }
}
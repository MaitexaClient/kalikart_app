import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/features/Root/view/root_screen.dart';
import 'package:kalicart/features/auth/view/login_screen.dart';
import 'package:kalicart/features/auth/view/otp_verification_screen.dart';
import 'package:kalicart/features/auth/view/sigin_up_screen.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/checkout/view/check_out_screen.dart';
import 'package:kalicart/features/checkout/view/confirm_screen.dart';
import 'package:kalicart/features/favourites/view/favourite_screen.dart';
import 'package:kalicart/features/home/view/category_list.dart';
import 'package:kalicart/features/home/view/home_screen.dart';
import 'package:kalicart/features/home/view/trending_screen.dart';
import 'package:kalicart/features/order/view/order_list_screen.dart';
import 'package:kalicart/features/product/view/product_details_screen.dart';
import 'package:kalicart/features/search/screen/search_screen.dart';

class AppRoute {
  static Route onGenaratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
          if(Db.isLoggedIn){
            return MaterialPageRoute(builder: (context) =>  const RootScreen());
          }else{
            return MaterialPageRoute(builder: (context) => const LoginScreen(),);
          }

      case RouteName.rootScreen:
       return  MaterialPageRoute(builder: (context) =>  const RootScreen());
                  
      case RouteName.loginScreen:
        
        return MaterialPageRoute(
          builder: (context) =>  const LoginScreen(),
        );
      case RouteName.signupScreen:
        return MaterialPageRoute(
          builder: (context) =>  const  SignUpScreen(),
        );
      case RouteName.otpverificationScreen:
        return MaterialPageRoute(
          builder: (context) => const OTPverificationScreen(),
        );
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);
      case  RouteName.categoryScreen:
        return MaterialPageRoute(builder: (context) => const CategoryListScreen(),);
      case RouteName.trendingScreen:
        return MaterialPageRoute(builder: (context) => const TrendingScreen(),);
      case RouteName.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchScreen(),);
      case RouteName.favouriteScreen:
        return MaterialPageRoute(builder: (context) => const FavouriteScreen(),);
      case RouteName.productDeatailsScreen:
        return MaterialPageRoute(builder: (context) => const ProductDetailsScreen(),);
      case RouteName.cartListScreen:
        return MaterialPageRoute(builder: (context) => const CartListScreen(),);
      case RouteName.checkOutScreen:
        return MaterialPageRoute(builder: (context) => const CheckOutScreen(),);
      case RouteName.confirmScreen:
        return MaterialPageRoute(builder: (context) => const ConfirmScreen(),);
      case RouteName.orderListScreen:
        return MaterialPageRoute(builder: (context) => const OrderListScreen(),);

    

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page'),
            ),
          ),
        );
    }
  }
}

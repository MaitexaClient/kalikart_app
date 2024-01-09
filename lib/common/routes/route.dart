import 'package:flutter/material.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/features/Root/view/root_screen.dart';
import 'package:kalicart/features/address/view/add_address_screen.dart';
import 'package:kalicart/features/address/view/edit_address_screen.dart';
import 'package:kalicart/features/address/view/my_address_list_screen.dart';
import 'package:kalicart/features/auth/view/login_screen.dart';
import 'package:kalicart/features/auth/view/otp_verification_screen.dart';
import 'package:kalicart/features/auth/view/sigin_up_screen.dart';
import 'package:kalicart/features/cart/view/cart_list_screen.dart';
import 'package:kalicart/features/checkout/view/check_out_screen.dart';
import 'package:kalicart/features/checkout/view/confirm_screen.dart';
import 'package:kalicart/features/favourites/view/favourite_screen.dart';
import 'package:kalicart/features/category/view/category_list.dart';
import 'package:kalicart/features/home/view/home_screen.dart';
import 'package:kalicart/features/home/view/trending_screen.dart';
import 'package:kalicart/features/home/view/video_screen.dart';
import 'package:kalicart/features/onboarding/view/on_boarding_screen.dart';
import 'package:kalicart/features/order/view/order_list_screen.dart';
import 'package:kalicart/features/order/view/track_order.dart';
import 'package:kalicart/features/payment/view/payment_screen.dart';
import 'package:kalicart/features/product/view/product_details_screen.dart';
import 'package:kalicart/features/product/view/product_list.dart';
import 'package:kalicart/features/product/view/product_list_subcat_screen.dart';
import 'package:kalicart/features/search/view/search_screen.dart';
import 'package:kalicart/features/wallet/view/my_wallet_screen.dart';

class AppRoute {
  static Route onGenaratedRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (Db.auth()) {
          return MaterialPageRoute(builder: (context) => const RootScreen());
        } else {
          return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          );
        }

      case RouteName.rootScreen:
        return MaterialPageRoute(builder: (context) => const RootScreen());

      case RouteName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RouteName.signupScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RouteName.otpverificationScreen:
        return MaterialPageRoute(
          builder: (context) => const OTPverificationScreen(),
        );
      case RouteName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteName.categoryScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoryListScreen(),
        );
      case RouteName.trendingScreen:
        return MaterialPageRoute(
          builder: (context) => TrendingScreen(),
        );
      case RouteName.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case RouteName.favouriteScreen:
        return MaterialPageRoute(
          builder: (context) => const FavouriteScreen(),
        );
      case RouteName.productDeatailsScreen:
        final productId = args as String;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            productId: productId,
          ),
        );
      case RouteName.cartListScreen:
        return MaterialPageRoute(
          builder: (context) => const CartListScreen(),
        );
      case RouteName.checkOutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckOutScreen(),
        );
      case RouteName.confirmScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmScreen(),
        );
      case RouteName.paymentConfirmationScreen:
          return MaterialPageRoute(builder: (context) =>const PaymentScreen(),);
      case RouteName.orderListScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderListScreen(),
        );
      case RouteName.productListSubCatScreen:
        String subCatName = args as String;
        return MaterialPageRoute(
          builder: (context) => ProductListSubCatScreen(
            subCatName: subCatName,
          ),
        );
      case RouteName.productListScreen:
        final params = args as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (context) => ProductListScreen(
            categoryName: params['catName'],
            catId: params['catId'],
          ),
        );
      case RouteName.videoScreener:
        final videoparams = args as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => VideoScreen(
            url: videoparams['url'],
            bannerId: videoparams['bannerId'],
          ),
        );
      case RouteName.walletScreen:
        return MaterialPageRoute(
          builder: (context) => const MyWallet(),
        );
      //address screen
      case RouteName.addressScreen:
        return MaterialPageRoute(
          builder: (context) => const MyAddressListScreen(),
        );
      case RouteName.addAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddUserAddress(),
        );
      case RouteName.editAddressScreen:
        final params = args as AddressModel;
        return MaterialPageRoute(
          builder: (context) => EditUserScreen(
            data: params,
          ),
        );
      case RouteName.orderTrackerScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderTrackerScreen(),
        );

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

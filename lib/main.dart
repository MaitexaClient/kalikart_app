import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/features/Root/controller/root_controller.dart';
import 'package:kalicart/features/address/controller/address_controller.dart';
import 'package:kalicart/features/auth/controller/auth_controller.dart';
import 'package:kalicart/features/cart/controller/cart_controller.dart';
import 'package:kalicart/features/category/controller/category_controller.dart';
import 'package:kalicart/features/checkout/controller/check_out_controller.dart';
import 'package:kalicart/features/favourites/controller/favourite_controller.dart';
import 'package:kalicart/features/home/controller/home_controller.dart';
import 'package:kalicart/features/order/controller/order_controller.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';
import 'package:kalicart/features/product/view/product_details_screen.dart';
import 'package:kalicart/features/profile/controller/profile_controller.dart';
import 'package:kalicart/features/search/controllers/search_controller.dart';
import 'package:kalicart/features/wallet/controller/wallet_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Db.init();

  Db.isLoggedIn = Db.auth() ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => RootController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchScreenController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductDetailsController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckOutController(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddressController(),
        ),
        ChangeNotifierProvider(
          create: (_) => WalletController(),
        ),
       
        ChangeNotifierProxyProvider<CartController,CheckOutController>(
          create: (context) => CheckOutController(cartController: Provider.of<CartController>(context,listen: false)), 
          update: (BuildContext context, CartController  value, CheckOutController ? previous) => CheckOutController(cartController: value),
          
          
        
        ),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.kWhiteColor,
            fontFamily: 'Plus Jakarta Sans'),
        onGenerateRoute: AppRoute.onGenaratedRoute,
        initialRoute: '/',
      ),
    );
  }
}

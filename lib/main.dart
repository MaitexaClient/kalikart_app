import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/routes/route.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/features/Root/controller/root_controller.dart';
import 'package:kalicart/features/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // await Db.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => RootController()),
      ],
      child:const Myapp(),
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
        initialRoute: '/login',
      ),
    );
  }
}

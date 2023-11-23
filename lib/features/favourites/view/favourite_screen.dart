import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/features/favourites/controller/favourite_controller.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/text_bold.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Favourites'),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Consumer<FavouriteController>(
            builder: (context, controller, child) {
              return controller.favaerateList.length == 0 ?  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset('assets/images/fav.png',width: 100.h,height: 100.h,),

                 const  SizedBox(height: 20,),
                  BoldTextStyle(size: 20.sp, text: 'No  Favourites Yet!'),
                  // RegularTextStyle(size: 16.sp, text: 'Commodo odio aenean\nsed adipiscing !'),
                  const SizedBox(height: 20,),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(color: AppColor.kGreenColor)
                    ),
                    onPressed: () {
                    
                  }, child: BoldTextStyle(size: 18.sp,color: AppColor.kGreenColor,text: 'Go to shop',))
        
                  
        
        
        
                ],
              ): Container();
            },
          ),
        ),
    );
  }
}
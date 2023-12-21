import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/wallet/controller/wallet_controller.dart';
import 'package:provider/provider.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {


  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final data = context.read<WalletController>();
  
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'My Wallet'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(255, 239, 225, 1),
                radius: 50,
                child: Image(
                  image: AssetImage(
                    'assets/images/my wallet.png',
                  ),
                  height: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            BoldTextStyle(size: 20.sp, text: 'Wallet Money'),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  RegularTextStyle(size: 16.sp, text: 'Fast & Easy Payment'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                RegularTextStyle(size: 16.sp, text: 'Secure Payment'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
          width:MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green,
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 25,
                left: 20,
                child: Text(
                  'WALLET MONEY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Positioned(
                top: 1,
                right: 1,
                child: Image(image: AssetImage('assets/images/Group 34110.png'),)
              ),

              const Positioned(
                top: 70,
                left: 20,
                child: Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
               Positioned(
                top: 100,
                left: 20,
                child: Text(
                  'Rs.${data.profile.profile?.creditPrice}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                  right: 1,
                  left: 1,
                  child:Container(
                    width:MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColor.kGreenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  )
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  'Date:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              // const Positioned(
              //   bottom: 20,
              //   left: 55,
              //   child: Text(
              //     '09/24',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 13,
              //     ),
              //   ),
              // ),
              const Positioned(
                  bottom: 20,
                  right: 20,
                  child: Image(image: AssetImage('assets/images/Group 26818.png'),)
              ),
            ],
          ),
        ),
            // const SizedBox(height: 10,),
            // TextButton.icon(     // <-- TextButton
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.add,
            //     size: 24.0,
            //     color: AppColor.kblack,
            //   ),
            //   label:  RegularTextStyle(size: 16.sp, text: 'Add Money')
            // ),
          ],
        ),
      ),
    );
  }
}

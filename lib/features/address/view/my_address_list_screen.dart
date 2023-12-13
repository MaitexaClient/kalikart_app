
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/regular_text.dart';
import 'package:kalicart/common/widgets/text_bold.dart';

class MyAddressListScreen extends StatefulWidget {
  const MyAddressListScreen({super.key});

  @override
  State<MyAddressListScreen> createState() => _MyAddressListScreenState();
}

class _MyAddressListScreenState extends State<MyAddressListScreen> {

  List name=["Leslie Alexander","Wade Warren"];
  List address=['2972 Westheimer Rd. Santa Ana, Illinois ','3891 Ranchview Dr. Richardson, California'];
  List pin=['85486','62639'];
  List phone=['(684) 555-0102','(308) 555-0121'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'My Addresses'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    body:Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularTextStyle(
              size: 16.sp,
              text: 'Your Adress'),

          const  SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (context,index){
              return   Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldTextStyle(size: 17.sp, text: name[index]),
                        PopupMenuButton<int>(
                          icon: const Icon(Icons.more_vert,color: Colors.grey),
                          itemBuilder: (context) => [
                            // PopupMenuItem 1
                           const  PopupMenuItem(

                              value: 1,
                              // row with 2 children
                              child: Row(
                                children: [
                                  Text("Edit")
                                ],
                              ),
                            ),
                            // PopupMenuItem 2
                            const PopupMenuItem(
                              value: 2,
                              // row with two children
                              child: Row(
                                children: [
                                 Text("Delete")
                                ],
                              ),
                            ),
                          ],
                          offset: const Offset(0, 100),
                          color: Colors.white,
                          elevation: 2,
                          // on selected we show the dialog box
                          onSelected: (value){
                            if(value == 1){
                              Navigator.pushNamed(context, RouteName.editAddressScreen);
                            }
                            if(value == 2){
                              print('deleteAddress');
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    RegularTextStyle(
                        size: 16.sp,
                        text: address[index]),
                    const SizedBox(height: 5,),
                    RegularTextStyle(
                        size: 16.sp,
                        text: pin[index]),
                    const SizedBox(height: 10,),
                    RegularTextStyle(
                        size: 16.sp,
                        text: phone[index]),
                  ],
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
                return const Divider();
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: PrimaryButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.addAddressScreen);
              },
              buttonText: 'Add New Address',
            ),
          ),
        ],
      ),
    ) ,
    );
  }
}

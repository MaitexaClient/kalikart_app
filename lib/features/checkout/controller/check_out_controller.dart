import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/features/cart/controller/cart_controller.dart';
import 'package:kalicart/features/payment/controller/payment_controller.dart';

class CheckOutController extends ChangeNotifier {
  final CartController? cartController;
  final PaymentController ? paymentController;

  CheckOutController({this.cartController,this.paymentController});

  final _apiService = ApiService();

  bool loading = false;

  AddressModel? primaryAddress;
  bool payMethod = false;
  int selectedOption = 0;

  int ? walletAmount;

  int  finalPrice = 0;


  //change payment method
  void changePaymentMethod(int value){
    payMethod = !payMethod;
    selectedOption = value;
    notifyListeners();


  }

  //add check out
  Future<void> addCheckOut({required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();

      await _apiService.addCheckOut();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //get primary address

  void getAddress({required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();

      primaryAddress = await _apiService.getPrimaryAddress();
      walletAmount = await _apiService.userWalletDetails();


      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }


  Future<void> updateOrder({required String addressId,required BuildContext context}) async {
      try {
        loading = true;
        notifyListeners();
        await _apiService.updateOrder(addressId: addressId);

         if(context.mounted){

          Navigator.pushNamed(context, RouteName.paymentConfirmationScreen);
         }

        loading = false;
        notifyListeners();
      } catch (e) {
        loading = false;
        notifyListeners();

        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    void  getWalletAmount(){


    }
    //wallet check out
    Future<void> walletCheckOut({required BuildContext context,required double price}) async{

      try{

        loading = true;
        notifyListeners();

        if(walletAmount != null && walletAmount != 0){

           finalPrice = await  _apiService.useWallet(price: price,walletAmount: walletAmount!);

        

        }else{

           if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const  SnackBar(content: Text('Your wallet is empty')));
        }

        }


      }catch(e){

          loading = false;
          notifyListeners();

         if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }



      }
    }


    Future<void> confirmWalletOrder() async {

      try{

        loading = true;
        notifyListeners();

        


      }catch(e){

      }



    }





}

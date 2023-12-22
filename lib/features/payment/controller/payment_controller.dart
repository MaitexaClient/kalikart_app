

import 'package:flutter/foundation.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController  extends ChangeNotifier{


  final _razorpay = Razorpay();

  final _apiService = ApiService();

  void initial(){

  }




void handlePaymentSuccess(PaymentSuccessResponse response) { 
  // Do something when payment succeeds 
} 
  
void handlePaymentError(PaymentFailureResponse response) { 
  // Do something when payment fails 
} 
  
void handleExternalWallet(ExternalWalletResponse response) { 
  // Do something when an external wallet is selected 
}


void createOrder({required double amount,}) async {
   

    try{

      Map<String, dynamic> body = {
      "amount": amount * 100,
      "currency": "INR",
      "receipt": 'idddddd',
    };
    await  _apiService.addPayment(
      password:  'x0dDkPUM40xjJh3Q1E3',
      userName:'rzp_test_uw4JbcsNp28aKd',
      data: body,
      );

      _razorpay.open(await openGateway());

    }catch(e){

      print(e);


    }
   
  }





 
Future openGateway() async {
    var options = {
      'key': '',
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'test',
    
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '923456789',
        'email': 'test@gmail.com'
      },
      "theme": {
        "color": '#b3d2ff',
      },
    };
    _razorpay.open(options);
  }



}
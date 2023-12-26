import 'package:flutter/foundation.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController  extends ChangeNotifier{


  final _razorpay = Razorpay();

  final _apiService = ApiService();

  void initial(){

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,handlePaymentError);

   // _razorpay.on(Razorpay.,handlePaymentSuccess);

    

  }




void handlePaymentSuccess(PaymentSuccessResponse response) { 

  print('success');
  
} 
  
void handlePaymentError(PaymentFailureResponse response) { 
  print('error');
} 
  
void handleExternalWallet(ExternalWalletResponse response) { 
  print('hi');
}


void createOrder({required double amount,}) async {
 
  
   

    try{

      Map<String, dynamic> body = {
      "amount": amount * 100,
      "currency": "INR",
      "receipt": 'idddddd',
    };
    await  _apiService.addPayment(
      password: 'bCHp3T0NBFwcP92wKBukXrCD',
      userName:'rzp_test_568BDWRZYY8pyf',
      data: body,
      );

      _razorpay.open(await openGateway());

      

    }catch(e){

      print('hi amount');
      print(e);

      


    }
   
  }





 
Future openGateway() async {
    var options = {
      'key': 'rzp_test_568BDWRZYY8pyf',
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'test',
    
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {
        'contact': '923456789',
        'email': 'test@gmail.com'
      },
      'external': {
      'wallets': ['paytm']
    },
      "theme": {
        "color": "#11A920",
      },
    };
    _razorpay.open(options);
}






}
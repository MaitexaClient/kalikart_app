

import 'package:flutter/foundation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController  extends ChangeNotifier{


  final _razorpay = Razorpay();

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



}
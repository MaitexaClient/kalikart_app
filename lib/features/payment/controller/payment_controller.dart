import 'package:flutter/material.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/features/payment/view/payment_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends ChangeNotifier {
  final _razorpay = Razorpay();

  final _apiService = ApiService();

  bool loading = false;

  void initial(BuildContext context) {
    void handlePaymentSuccess(PaymentSuccessResponse response) async {
      Navigator.pushNamed(context, RouteName.paymentConfirmationScreen);
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);

    // _razorpay.on(Razorpay.,handlePaymentSuccess);
  }

  void handlePaymentError(PaymentFailureResponse response) {}

  void handleExternalWallet(ExternalWalletResponse response) {}

  Future<void> createOrder(
      {required double amount, required BuildContext context}) async {
    try {
      Map<String, dynamic> body = {
        "amount": amount * 100,
        "currency": "INR",
        "receipt": 'idddddd',
      };
      String resId = await _apiService.addPayment(
        password: 'bCHp3T0NBFwcP92wKBukXrCD',
        userName: 'rzp_test_568BDWRZYY8pyf',
        data: body,
      );

      await openGateway(resId);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future openGateway(String id) async {
    var options = {
      'key': 'rzp_test_568BDWRZYY8pyf',
      'amount': 100, //in the smallest currency sub-unit.
      'name': 'test',
      'order_id': id,
      'timeout': 60 * 5, // in seconds // 5 minutes
      'prefill': {'contact': '923456789', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      },
      "theme": {
        "color": "#11A920",
      },
    };
    _razorpay.open(options);
  }

  //navigate confirm screen

  navigate(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentScreen(),
        ));
  }
}

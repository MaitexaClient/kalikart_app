import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalicart/features/payment/controller/payment_controller.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaymentController>(context, listen: false).initial();
      
    });

    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
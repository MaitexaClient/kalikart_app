import 'package:flutter/material.dart';
import 'package:kalicart/features/cart/controller/cart_controller.dart';

class CheckOutController extends ChangeNotifier{

  final  CartController  ? cartController;


  CheckOutController({this.cartController});

  
}
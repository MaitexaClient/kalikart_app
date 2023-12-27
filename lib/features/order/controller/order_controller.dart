import 'package:flutter/material.dart';
import 'package:kalicart/common/models/order_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class OrderController extends ChangeNotifier {
  List<OrderModel> orderList = [];

  final _apiService = ApiService();

  bool loading = false;

  //get all order list

  void getAllOrder({required BuildContext context}) async{
    try {
      loading = true;
      notifyListeners();
      orderList =  await  _apiService.viewAllOrder();
      loading = false;
      notifyListeners();

    } catch (e) {
      
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      }
    }
  }



  
}

import 'package:flutter/material.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class ProductDetailsController extends ChangeNotifier{

  bool  loading = false;
  List<ProductModel> productList = [];

  final _apiService = ApiService();


  void getAllProductByCat(BuildContext context) async{

    try{

      loading =true;
      notifyListeners();
      productList = await  _apiService.getAllProductByCategory(catId: '6557454d5dac0598a6523d4e');
      loading = false;
      notifyListeners();



    }catch(e){

      loading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).


    }


  }


  



  


}
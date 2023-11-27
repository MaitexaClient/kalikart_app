import 'dart:convert';
import 'dart:ffi';

import 'package:kalicart/common/helper/api_helper.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/utils/api_constants.dart';

class ApiService {
  final _apiHelper = ApiHelper();

  //sign up
  Future<void> signUp(
      {String? name,
      String? email,
      String? confirmPassword,
      String? phone}) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.signUp);

    final data = {
      'name':  name,
      'email':  email,
      'password': confirmPassword,
      'phone':  phone
    };

    var response = await _apiHelper.postData(data: data, url: url);


    if (response.statusCode != 200) {
      throw response.body;
    }
  }

  //login
  Future<Map<String,dynamic>> login(
      {
      String? email,
      String? password,
    }) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.login);
 
    final data = {
    
      'email':  email,
      'password': password,
    
    };

    var response = await _apiHelper.postData(data: data, url: url);

    Map<String,dynamic> body = jsonDecode(response.body);





    if (response.statusCode  == 200) {

        return body;


      
    }else{

      throw 'Somthing went wrong';
    }
  }

  //category list
  Future<List<Category>> getCategoryList() async{

     final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.categoryList);
    var response = await _apiHelper.getData(url: url);

     var data =  jsonDecode(response.body);

 

     if (response.statusCode  == 200) {
      List<Category> dataList =  data["data"].map<Category>((e)=> Category.fromJson(e)).toList();
     
      return dataList;
    }else{

      throw 'Somthing went wrong';
    }



  }

  getAllProductByCategory(){
    
  }

}

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kalicart/common/helper/api_helper.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/models/cart_model.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/models/faviorate_model.dart';
import 'package:kalicart/common/models/image_banner_model.dart';
import 'package:kalicart/common/models/order_model.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/models/user_model.dart';
import 'package:kalicart/common/models/video_banner.dart';
import 'package:kalicart/common/services/db_service.dart';
import 'package:kalicart/common/utils/api_constants.dart';

class ApiService {
  final _apiHelper = ApiHelper();
  final myLoginId = Db.getLoginId();

  //sign up
  Future<void> signUp(
      {String? name,
      String? email,
      String? confirmPassword,
      String? phone}) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.signUp);

    final data = {
      'name': name,
      'email': email,
      'password': confirmPassword,
      'phone': phone
    };

    var response = await _apiHelper.postData(data: data, url: url);

    if (response.statusCode != 200) {
      throw response.body;
    }
  }

  //login
  Future<Map<String, dynamic>> login({
    String? email,
    String? password,
  }) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.login);

    final data = {
      'email': email,
      'password': password,
    };

    var response = await _apiHelper.postData(data: data, url: url);

    Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return body;
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get profile user
  Future<User> getProfile() async {
    String loginId = Db.getLoginId();
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.getProfile + loginId);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return User.fromJson(data["data"][0]);
    } else {
      throw 'Somthing went wrong';
    }
  }

  // //update profile
  Future<User> updateProfile(
      {String? name, String? email, String? phoneNumber, File? image}) async {
    final url = Uri.parse(
        ApiConstant.baseUrl + ApiConstant.updateUser + Db.getLoginId());

    // Create a multipart request
    final request = http.MultipartRequest('PUT', url);

    // Add fields to the request
    if (email != null) {
      request.fields['email'];
    }
    if (name != null) {
      request.fields['name'] = name;
    }
    if (phoneNumber != null) {
      request.fields['phone'] = phoneNumber;
    }

    // Add image to the request if available
    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final parsedData = json.decode(responseData);
      return User(
        email: parsedData['email'],
        name: parsedData['name'],
        phone: parsedData['phoneNumber'],
      );
    } else {
      throw 'Failed to update profile';
    }
  }

  //view address
  Future<List<AddressModel>> getAllAddress() async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.viewAddress + myLoginId);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      return data.map<AddressModel>((e) => AddressModel.fromJson(e)).toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //add address

  Future<void> addAddressByUser({
    required String name,
    required String phone,
    required String address,
    required String city,
    required String pinCode,
    required String landmark,
  }) async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.addAddress + myLoginId);
    var response = await _apiHelper.postData(
      data: {
        'name': name,
        'phone': phone,
        'address': address,
        'pincode': pinCode,
        'city': city,
        'landmark': landmark
      },
      url: url,
    );

    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //delete address
  Future<void> deleteAddress({required String addressId}) async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.deleteAddress + addressId);

    var response = await _apiHelper.deleteData(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //edit address
  Future<void> editAddress({
    required String name,
    required String phone,
    required String address,
    required String city,
    required String pinCode,
    required String landmark,
    required String addressId,
  }) async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.editAddres + addressId);
    var response = await _apiHelper.putDataWithBody(
      data: {
        'name': name,
        'phone': phone,
        'address': address,
        'pincode': pinCode,
        'city': city,
        'landmark': landmark
      },
      url: url,
    );

    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //set primary address

  Future<void> setPrimaryAddress({required int addressCount}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.addAddress + myLoginId}/$addressCount');

    var response = await _apiHelper.putData(
      url: url,
    );

    if (response.statusCode == 201) {
      print(response.body);
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get primary address

  Future<AddressModel> getPrimaryAddress() async {
    final url = Uri.parse(
        ApiConstant.baseUrl + ApiConstant.getPrimaryAddress + myLoginId);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];

      return AddressModel.fromJson(data);
    } else {
      throw 'Somthing went wrong';
    }
  }

  //video banner

  Future<List<VideoBanner>> getAllVideoBannerList() async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.bannerVideo);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      var videoList = jsonDecode(response.body)["data"];

      return videoList
          .map<VideoBanner>((e) => VideoBanner.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //add credit point
  Future<String> addCreditPoint({required String bannerId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl}${ApiConstant.addCreditPoint}$bannerId/$myLoginId');

    var response = await _apiHelper.putData(url: url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data["creditPrice"].toString();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get all trending product
  Future<List<ProductModel>> getAllTrendingProduct() async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.trendingProduct);
    var response = await _apiHelper.getData(url: url);

    if (response.statusCode == 200) {
      var videoList = jsonDecode(response.body)["data"];

      return videoList
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //category list
  Future<List<Category>> getCategoryList() async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.categoryList);
    var response = await _apiHelper.getData(url: url);

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<Category> dataList =
          data["data"].map<Category>((e) => Category.fromJson(e)).toList();

      return dataList;
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get subcategory by  category
  Future<List<dynamic>> getSubCategory({required String catId}) async {
    final url =
        Uri.parse('${ApiConstant.baseUrl + ApiConstant.subCategory}$catId');
    var response = await _apiHelper.getData(url: url);
    var data = jsonDecode(response.body);

    List<dynamic>? subCatList = data["data"];

    if (response.statusCode == 200) {
      return subCatList ?? [];
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get all product by category
  Future<List<ProductModel>> getAllProductByCategory(
      {required String catId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.productListByCat}/$catId');
    var response = await _apiHelper.getData(url: url);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["data"]
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get all product by  subcategory
  Future<List<ProductModel>> getAllProductBySubCategory(
      {required String subCat}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.getAllProductBySubCat}$subCat');
    var response = await _apiHelper.getData(url: url);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["data"]
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //getsingle product details
  Future<ProductModel> getSingleProductDetails(
      {required String productId}) async {
    final url = Uri.parse(
        ApiConstant.baseUrl + ApiConstant.getSingleProductDetails + productId);
    var response = await _apiHelper.getData(url: url);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ProductModel.fromJson(data["data"]);
    } else {
      throw 'Somthing went wrong';
    }
  }

  //add to cart
  Future<void> addTocart(
      {required String productId,
      required String loginId,
      required String price}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl}${ApiConstant.addCart}$loginId/$productId');

    final body = {'price': price};
    var response = await _apiHelper.postData(url: url, data: body);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //orders
  // Future<List> getOrders() async{
  //   final url = Uri.parse(ApiConstant.baseUrl+ApiConstant.orderList+myLoginId);

  //   var response =  await _apiHelper.getData(url: url);
  //   var data = jsonDecode(response.body);

  //   if(response.statusCode == 200){

  //   }else{
  //     throw 'Somthing went wrong';
  //   }
  // }

  //add check out

  Future<void> addCheckOut() async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.addtoCheckOut + myLoginId);

    var response = await _apiHelper.postDataWithOutBody(url: url);

    if (response.statusCode == 200) {
    } else {
      throw 'somthing went wrong';
    }
  }

  // //completed orders list
  // Future<List> getCompletedOrders() async{
  //   final url = Uri.parse(ApiConstant.baseUrl+ApiConstant.completeOrederList+myLoginId);

  //   var response =  await _apiHelper.getData(url: url);
  //   var data = jsonDecode(response.body);

  //   if(response.statusCode == 200){
  //     re

  //   }else{
  //     throw 'Somthing went wrong';
  //   }
  // }

  //get banner images
  Future<List<ImageBanner>> getBannerImages() async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.bannerImages);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["data"]
          .map<ImageBanner>((e) => ImageBanner.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get all cart
  Future<CartModel> getAllCart({required String loginId}) async {
    final url =
        Uri.parse('${ApiConstant.baseUrl + ApiConstant.getAllCart}$loginId');

    var response = await _apiHelper.getData(url: url);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return CartModel.fromJson(data['data'][0]);
    } else {
      throw 'Somthing went wrong';
    }
  }

  //increament -19
  Future<void> cartIncreament(String cartProductId) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl}${ApiConstant.cartIncreament}$myLoginId/$cartProductId');

    var response = await _apiHelper.putData(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //decreament -20
  Future<void> cartDecreament(String cartProductId) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.cartDecrement + myLoginId}/$cartProductId');

    var response = await _apiHelper.putData(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  // delete cart
  Future<void> deleteCart({required String cartId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.deleteCart + myLoginId}/$cartId');
    var response = await _apiHelper.deleteData(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //search product by name
  Future<List<ProductModel>> getSearchItems(String searchQuery) async {
    final url = Uri.parse(
        ApiConstant.baseUrl + ApiConstant.searchProductName + searchQuery);
    var response = await _apiHelper.getData(url: url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data["data"]
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw 'Somthing went wrong';
    }
  }

  //get all favorite list
  Future<List<FavouriteModel>> getAllFavoriteProductList() async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.allFavourite + myLoginId);
    var response = await _apiHelper.getData(url: url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<FavouriteModel> fvList = data["data"]
          .map<FavouriteModel>((e) => FavouriteModel.fromJson(e))
          .toList();

      return fvList;
    } else {
      throw 'Somthing went wrong';
    }
  }

  //add to favorite
  Future<void> addFavorite({required String productId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.addtoFavourite + myLoginId}/$productId');

    var response = await _apiHelper.postDataWithOutBody(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //delete favorite
  Future<void> deleteFavorite({required String favoriteId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl}${ApiConstant.deleteFavorite}$myLoginId/$favoriteId');

    var response = await _apiHelper.deleteData(url: url);

    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //payment integration
  Future<String> addPayment(
      {required String userName,
      required String password,
      required Map<String, dynamic> data}) async {
    var response = await _apiHelper.paymentPost(
      userName: userName,
      password: password,
      data: data,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["id"];
    } else {
      throw 'Somthing went wrong';
    }
  }

  //add order
  Future<void> updateOrder({required addressId}) async {
    final url = Uri.parse(
        '${ApiConstant.baseUrl + ApiConstant.updateOrder + myLoginId}/$addressId/1');

    var response = await _apiHelper.postDataWithOutBody(url: url);
    if (response.statusCode != 200) {
      throw 'Somthing went wrong';
    }
  }

  //view order list
  Future<List<OrderModel>> viewAllOrder() async {
    final url =
        Uri.parse(ApiConstant.baseUrl + ApiConstant.orderList + myLoginId);

    var response = await _apiHelper.getData(url: url);

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data["data"]
          .map<OrderModel>((e) => OrderModel.fromJson(e))
          .toList();
    } else {
      throw "Somthing went wrong";
    }
  }
}

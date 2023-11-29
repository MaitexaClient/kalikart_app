import 'package:flutter/material.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/common/services/db_service.dart';

class ProductDetailsController extends ChangeNotifier {
  bool loading = false;
  List<ProductModel> productList = [];
  ProductModel? singleProductDeatails;

  final _apiService = ApiService();

  //get all product by caegory
  void getAllProductByCat(BuildContext context, String catId) async {
    try {
      loading = true;
      notifyListeners();
      productList = await _apiService.getAllProductByCategory(catId: catId);

      loading = false;
      notifyListeners();
    } catch (e) {
      productList.clear();
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //get product details
  void getSingleProduct(BuildContext context, String productid) async {
    try {
      loading = true;
      notifyListeners();

      singleProductDeatails =
          await _apiService.getSingleProductDetails(productId: productid);

      loading = false;
      notifyListeners();
    } catch (e) {
      singleProductDeatails = null;
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  //add to cart
  void addCart(
      {
      required  String productId, 
      required  String price,
      required BuildContext context,}
      ) async {
    try {
      loading = true;
      notifyListeners();
      await  Db.init();
      final loginId = Db.getLoginId();
      await _apiService.addTocart(productId: productId, loginId: loginId, price: price);
      if(context.mounted){
        Navigator.pushNamed(context, RouteName.cartListScreen);
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }
}

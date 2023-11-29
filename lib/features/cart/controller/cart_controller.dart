import 'package:flutter/material.dart';
import 'package:kalicart/common/models/cart_model.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/common/services/db_service.dart';

class CartController extends ChangeNotifier {
  List cartList = [];

  CartModel? allCartData;

  bool loading = false;

  final _apiService = ApiService();

  Future<void> getAllcart(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      allCartData = await _apiService.getAllCart(loginId: Db.getLoginId());

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

  //increament
  Future<void> increament(String cartProductId, BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      await _apiService.cartIncreament(cartProductId);
      allCartData = await _apiService.getAllCart(loginId: Db.getLoginId());
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

  //decreament
  Future<void> decreament(String cartProductId, BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      await _apiService.cartDecreament(cartProductId);
      allCartData = await _apiService.getAllCart(loginId: Db.getLoginId());
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

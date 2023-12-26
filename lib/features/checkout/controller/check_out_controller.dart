import 'package:flutter/material.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/features/cart/controller/cart_controller.dart';

class CheckOutController extends ChangeNotifier {
  final CartController? cartController;

  CheckOutController({this.cartController});

  final _apiService = ApiService();

  bool loading = false;

  AddressModel? primaryAddress;

  //add check out
  void addCheckOut({required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();

      await _apiService.addCheckOut();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //get primary address

  void getAddress({required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();

      primaryAddress = await _apiService.getPrimaryAddress();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }


  void updateOrder({required String addressId,required BuildContext context}) async {
      try {
        loading = true;
        notifyListeners();
        await _apiService.updateOrder(addressId: addressId);
        loading = false;
        notifyListeners();
      } catch (e) {
        loading = false;
        notifyListeners();

        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
}

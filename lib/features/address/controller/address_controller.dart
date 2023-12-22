import 'package:flutter/material.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class AddressController extends ChangeNotifier {
  final _apiService = ApiService();

  bool loading = false;

  List<AddressModel> listAddress = [];

  void addAddress({
    required String name,
    required String phone,
    required String address,
    required String pinCode,
    required String state,
    required String city,
    required String landmark,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      await _apiService.addAddressByUser(
        name: name,
        phone: phone,
        address: address,
        city: city,
        pinCode: pinCode,
        landmark: landmark,
      );

      listAddress = await _apiService.getAllAddress();

      if (context.mounted) {
        Navigator.pop(context);
      }

      loading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Somthing went wrong'),
          ),
        );
      }
    }
  }

  void getAllAddress(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();

      listAddress = await _apiService.getAllAddress();

      loading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Somthing went wrong'),
          ),
        );
      }
    }
  }

  //delete address handler

  void deleteAddress(
      {required BuildContext context, required String addressId}) async {
    try {
      loading = true;
      notifyListeners();

      await _apiService.deleteAddress(addressId: addressId);

      listAddress = await _apiService.getAllAddress();

      loading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Somthing went wrong'),
          ),
        );
      }
    }
  }

  //update address
  void updateAddress({
    required String name,
    required String phone,
    required String address,
    required String pinCode,
    required String state,
    required String city,
    required String landmark,
    required String addressId,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      await _apiService.editAddress(
          name: name,
          phone: phone,
          address: address,
          city: city,
          pinCode: pinCode,
          landmark: landmark,
          addressId: addressId);

      listAddress = await _apiService.getAllAddress();

      if (context.mounted) {
        Navigator.pop(context);
      }

      loading = false;
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Somthing went wrong'),
          ),
        );
      }
    }
  }

  //select address
  void selectAddress(
      {required int addressCount, required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();
      await _apiService.setPrimaryAddress(addressCount: addressCount);

      listAddress = await _apiService.getAllAddress();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Somthing went wrong'),
          ),
        );
      }
    }
  }
}

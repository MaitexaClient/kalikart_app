import 'package:flutter/material.dart';
import 'package:kalicart/common/models/faviorate_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class FavouriteController extends ChangeNotifier {
  List<FavouriteModel> _favaerateList = [];

  List<FavouriteModel> get favaerateList => _favaerateList;
  bool loading = false;
  final _apiService = ApiService();

  void getAllFeverateList(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();

      _favaerateList = await _apiService.getAllFavoriteProductList();

      

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Somthing went wrong')));
      }
    }
  }
}

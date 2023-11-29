import 'package:flutter/material.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class HomeController extends ChangeNotifier {
  bool loading = false;

  List<Category> categoryList = [];

  final  _apiService = ApiService();

  //home inital call
  void initial(BuildContext context) async {
    await getCategoryList(context);
  }

  //category list
  Future<void> getCategoryList(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      categoryList = await _apiService.getCategoryList();
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

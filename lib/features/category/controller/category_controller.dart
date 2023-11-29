import 'package:flutter/material.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class CategoryController extends ChangeNotifier {
  List<Category> categoryList = [];
  List<dynamic> subCatList = [];

  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  bool loading = false;
  final _apiService = ApiService();

  void changePage(int index, BuildContext context,
      {required String catId}) async {
    _selectedIndex = index;
    notifyListeners();

    await getSubCategoryList(context, catId: catId);
  }

  //category list
  Future<void> getCategoryList(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      categoryList = await _apiService.getCategoryList();

      subCatList = await _apiService.getSubCategory(
          catId: categoryList[selectedIndex].sId.toString());

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

  //getSub Catgory list
  Future<void> getSubCategoryList(BuildContext context,
      {required String catId}) async {
    try {
      loading = true;
      notifyListeners();
      subCatList = await _apiService.getSubCategory(catId: catId);

      loading = false;
      notifyListeners();
    } catch (e) {
      subCatList = [];
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

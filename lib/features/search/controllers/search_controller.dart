import 'package:flutter/material.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class SearchScreenController extends ChangeNotifier {
  final _apiService = ApiService();
  bool loading = false;

  List<ProductModel> _filteredProducts = [];

  List<ProductModel> get filteredProducts => _filteredProducts;

  void getfilterProducts(BuildContext context, {required searchQuery}) async {
    try {
      loading = true;
      notifyListeners();

      _filteredProducts = await _apiService.getSearchItems(searchQuery);

      loading = false;
      notifyListeners();
    } catch (e) {
      _filteredProducts = [];
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
         const  SnackBar(
            content: Text('No product found'),
          ),
        );
      }

      loading = false;
      notifyListeners();
    }
  }
}

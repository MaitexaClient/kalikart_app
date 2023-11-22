import 'package:flutter/material.dart';

class SearchScreenController extends ChangeNotifier {
  List<String> _allProducts = [
    'Product 1',
    'Product 2',
    'Product 3',
    // Add more products
  ];

  String _searchQuery = '';
  List<String> _filteredProducts = [];

  String get searchQuery => _searchQuery;

  List<String> get filteredProducts => _filteredProducts;

  set searchQuery(String value) {
    _searchQuery = value;
    _filterProducts();
    notifyListeners();
  }

  void _filterProducts() {
    _filteredProducts = _allProducts
        .where((product) => product.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }
}

import 'package:flutter/material.dart';

class CategoryController extends ChangeNotifier{

  List  categoryNameList = ['fasion','electronic','house hold'];
  List  categoryProductList = [];
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;


  void changePage(int index){

    _selectedIndex = index;

    if(categoryNameList[index]=='fasion'){

      categoryProductList.addAll(['men','women','kids']);
      

    }else{

        categoryProductList.clear();

    }
    notifyListeners();
  }



}
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{

  bool loading = false;

   int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;

  List  categoryNameList = ['fasion','electronic','house hold'];
  List  categoryProductList = [];



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
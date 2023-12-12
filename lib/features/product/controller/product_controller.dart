import 'package:flutter/material.dart';
import 'package:kalicart/common/models/faviorate_model.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/common/services/db_service.dart';

class ProductDetailsController extends ChangeNotifier {
  bool loading = false;
  List<ProductModel> productList = [];
  List<ProductModel> subCategoryProductList = [];
  ProductModel? singleProductDeatails;
  List<FavouriteModel> favaerateList = [];

  final _apiService = ApiService();

  //get all product by caegory
  void getAllProductByCat(BuildContext context, String catId) async {
    try {
      loading = true;
      notifyListeners();
      productList = await _apiService.getAllProductByCategory(catId: catId);

      loading = false;
      notifyListeners();
    } catch (e) {
      productList.clear();
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //get product details
  void getSingleProduct(BuildContext context, String productid) async {
    try {
      loading = true;
      notifyListeners();

      singleProductDeatails = await _apiService.getSingleProductDetails(productId:productid );

      loading = false;
      notifyListeners();
    } catch (e) {
      singleProductDeatails = null;
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

  //get all product by sub category

  void getAllProductBySubCat(BuildContext context, String subCat) async {
    try {
      loading = true;
      notifyListeners();

      subCategoryProductList =
          await _apiService.getAllProductBySubCategory(subCat: subCat);

      loading = false;
      notifyListeners();
    } catch (e) {
      productList.clear();
      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //add to cart
  void addCart({
    required String productId,
    required String price,
    required BuildContext context,
  }) async {
    try {
      loading = true;
      notifyListeners();
      await Db.init();
      final loginId = Db.getLoginId();
      await _apiService.addTocart(
          productId: productId, loginId: loginId, price: price);

      if (context.mounted) {
        await Navigator.pushNamed(context, RouteName.cartListScreen);
      }
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

  //add to faveriout
  void addToFavourite(
      {required String productId, required BuildContext context}) async {
    try {
      loading = true;
      notifyListeners();

      await _apiService.addFavorite(productId: productId);
      favaerateList = await _apiService.getAllFavoriteProductList();

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

  //get all Favorite
  void getAllFavourite({required BuildContext context}) async {
    print('fffffffffff');
    try {
      loading = true;
      notifyListeners();

      favaerateList = await _apiService.getAllFavoriteProductList();

      loading = false;
      notifyListeners();
    } catch (e) {
      favaerateList = [];

      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }

  //check
  bool checkFaviorite({required String productId}) {
    
    return favaerateList.any((element) {
      return element.productId == productId;
    });

   

  }

  //delete facorites
  void  deleteFavorite({required String productId,required BuildContext context}) async{
    try{
      loading = true;
      notifyListeners();

      final FavouriteModel favorite = favaerateList.firstWhere((element) =>  element.productId == productId);
      
      await _apiService.deleteFavorite(favoriteId: favorite.sId!);
      
      
      favaerateList = await _apiService.getAllFavoriteProductList();

      loading = false;
      notifyListeners();

    }catch(e){

     

      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }

    }


    
  }
}

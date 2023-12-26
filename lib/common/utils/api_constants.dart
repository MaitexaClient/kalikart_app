import 'package:kalicart/features/order/widgets/completed_order_widget.dart';

class ApiConstant{

  static const baseUrl = 'https://kalikart-server.onrender.com/api';

  static const signUp = '/register';
  static const login = '/login';
  static const categoryList = '/view-category';
  static const subCategory = '/filter-product_cat_sub/';
  static const productListByCat = '/filter-product_cat';
  static const getSingleProductDetails = '/view-product/';
  static const addCart = '/add-cart/';
  static const getAllCart = '/view-cart/';
  static const cartIncreament = '/increment-cart/';
  static const cartDecrement = '/decrement-cart/';
  static const deleteCart = '/delete-cart/';
  static const getProfile  = '/user-profile/';
  static const getAllProductBySubCat = '/filter-product_sub_cat/';
  static const searchProductName = '/search-product/';
  static const addtoFavourite = '/add-wishlist/';
  static const allFavourite = '/view-wishlist/';
  static const deleteFavorite = '/delete-wishlist/';

  static const user = '/user-profile/';
  static const updateUser = '/user-profile-update/';
  static const bannerImages = '/view-banners/images';
  static const bannerVideo = '/view-banners/videos';
  static const trendingProduct = '/view-products/trending';
  static const addCreditPoint = '/banner-credit/';
 
  static const completeOrederList = '/completed-orders/';
  static const addtoCheckOut  = '/add-orders/';
  
  //add address
  static const viewAddress = '/user-all-address/';
  static const addAddress = '/user-address/';
  static const deleteAddress = '/user-del-address/';
  static const editAddres = '/user-address-update/';
  static const getPrimaryAddress = '/user-primary-address/';


  //order
   static const updateOrder = '/update-orders-status/';
    static const orderList = '/view-orders/';
   
   
  


  
  

  
   

}
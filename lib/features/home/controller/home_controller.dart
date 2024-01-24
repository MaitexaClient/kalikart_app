import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/models/image_banner_model.dart';
import 'package:kalicart/common/models/product_model.dart';
import 'package:kalicart/common/models/video_banner.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/features/product/controller/product_controller.dart';

class HomeController extends ChangeNotifier {
  bool loading = false;

  String ? location;


  List categoryList = [];
  List bannerImages = [];
  List<VideoBanner> bannerVideos = [];
  List<ProductModel> trendingList = [];




  String  ? creditPoint;


  final _apiService = ApiService();
  final prodocutController = ProductDetailsController();


  
  

  //home inital call
  void initial(BuildContext context) async {
    loading = true;
    notifyListeners();
    if(context.mounted){
      
     await getCategoryList(context);
      getImageBanner(context);
      getVideoBanners(context);
       getAllTrending(context);

  
    }

    loading = false;
    notifyListeners();
  }

  //category list
  Future<void> getCategoryList(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();

      categoryList = await _apiService.getCategoryList();

      loading =false;
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

  //get image banner
  Future<void> getImageBanner(BuildContext context) async {
    try {
     bannerImages = [
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/super-store-post-card-design-template-447f89b43aab9470ca3d6fe0442ebddf_screen.jpg?ts=1698449866',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/easter%2C-event%2C-spring%2C-party-design-template-bb2ea780113fdfa061e370332d3e3c79_screen.jpg?ts=1698501218'
     
     ];
    } catch (e) {
      loading = false;
      notifyListeners();


      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  //get video banners
  Future<void> getVideoBanners(BuildContext context) async{

    try{

      loading = true;
      notifyListeners();
      bannerVideos = await _apiService.getAllVideoBannerList();
      loading = false;
      notifyListeners();
    }catch(e){
      loading = false;
      notifyListeners();


      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
        


    }

  }
  //get Trending list
  Future<void> getAllTrending(BuildContext context) async{
    try{
      loading = true;
      notifyListeners();

      trendingList = await  _apiService.getAllTrendingProduct();

      loading = false;
      notifyListeners(); 

    }catch(e){

      loading = false;
      notifyListeners();


      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }



    }
  }

  bool checkFaviorite(String productId){
    
    return prodocutController.checkFaviorite(productId: productId);
  }



  void addCreditPoint({required String bannerId,required  BuildContext context}) async{

    try{
      loading = true;
      notifyListeners();


      creditPoint = await  _apiService.addCreditPoint(bannerId: bannerId);


      loading = false;
      notifyListeners();

    }catch(e){

    

       loading = false;
      notifyListeners();


      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }



       

    }


    
  }

  //check permission
    Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      await _requestLocationPermission();
    } else if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
    } else {
      getCurrentLocation();
     
    }
  }
  //request location permission
  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    
    if (permission == LocationPermission.denied) {
      // Handle denied permission
    } else if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
    } else {

      getCurrentLocation();
      
    }
  }

  //get current location
  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

          var firsAddress = placemarks.first;

    location = "${firsAddress.street},${firsAddress.subLocality},${firsAddress.administrativeArea},${firsAddress.postalCode}";
    notifyListeners();
      
  }
}



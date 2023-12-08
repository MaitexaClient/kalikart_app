import 'package:flutter/material.dart';
import 'package:kalicart/common/models/category_model.dart';
import 'package:kalicart/common/models/image_banner_model.dart';
import 'package:kalicart/common/models/video_banner.dart';
import 'package:kalicart/common/services/api_services.dart';

class HomeController extends ChangeNotifier {
  bool loading = false;

  List<Category> categoryList = [];
  List<ImageBanner> bannerImages = [];
  List<VideoBanner> bannerVideos = [];

  final _apiService = ApiService();

  //home inital call
  void initial(BuildContext context) async {
    loading = true;
    notifyListeners();
    await getCategoryList(context);
    await getImageBanner(context);
    await getVideoBanners(context);

    loading = false;
    notifyListeners();
  }

  //category list
  Future<void> getCategoryList(BuildContext context) async {
    try {
      categoryList = await _apiService.getCategoryList();
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
     bannerImages = await  _apiService.getBannerImages();
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
}

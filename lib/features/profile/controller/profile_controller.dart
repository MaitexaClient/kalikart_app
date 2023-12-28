import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalicart/common/models/user_model.dart';
import 'package:kalicart/common/routes/route_name.dart';
import 'package:kalicart/common/services/api_services.dart';
import 'package:kalicart/common/services/db_service.dart';

class ProfileController extends ChangeNotifier {
  User? profile;
  bool loading = false;
  File? image;

  final _apiService = ApiService();

  Future<void> takeImage({required ImageSource imageSource}) async {
    final ImagePicker picker = ImagePicker();

    final XFile? selctedImage = await picker.pickImage(source: imageSource);

    if(selctedImage != null){
      image = File(selctedImage.path);

      notifyListeners();

    }
    notifyListeners();

  }

  //get all profile details
  void getProfile(BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      profile = await _apiService.getProfile();
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

  //update profile

  void updateProfile(BuildContext context,
      {String? name, String? email, String? phone, File? image}) async {
    try {
      loading = true;
      notifyListeners();

      await _apiService.updateProfile(
          name: name, email: email, phoneNumber: phone, image: image);

      //profile = await _apiService.getProfile();
     

    

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
         loading = false;
      notifyListeners();
      }
    } catch (e) {

      loading = false;
      notifyListeners();

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }


    }
  }

  void logout(BuildContext context){

    Db.removeAuth();
    Navigator.pushNamedAndRemoveUntil(context, RouteName.loginScreen, (route) => false);


  }
}

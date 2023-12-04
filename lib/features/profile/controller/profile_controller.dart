import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kalicart/common/models/user_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class ProfileController extends ChangeNotifier {
  User? profile;
  bool loading = false;
  File? image;

  final _apiService = ApiService();

  Future<void> takeImage({required ImageSource imageSource}) async {
    final ImagePicker picker = ImagePicker();

    final XFile? selctedImage = await picker.pickImage(source: imageSource);

    image = File(selctedImage!.path);
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

  void updateProfile(
      {String? name, String? email, String? phone, File? image}) async {
    try {
      loading = true;
      notifyListeners();

      _apiService.updateProfile(
          name: name, email: email, phoneNumber: phone, image: image);
      loading = false;
      notifyListeners();
    } catch (e) {}
  }
}

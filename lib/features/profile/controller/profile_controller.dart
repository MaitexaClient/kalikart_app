import 'package:flutter/material.dart';
import 'package:kalicart/common/models/user_model.dart';
import 'package:kalicart/common/services/api_services.dart';

class ProfileController extends ChangeNotifier {
  User? profile;
  bool loading = false;

  final _apiService = ApiService();

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
}

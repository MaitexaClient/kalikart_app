import 'package:flutter/material.dart';
import 'package:kalicart/features/profile/controller/profile_controller.dart';

class WalletController extends ChangeNotifier{
  bool loading = false;

  final ProfileController profile;

  WalletController({required this.profile});

  
}
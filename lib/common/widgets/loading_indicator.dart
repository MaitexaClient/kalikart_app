import 'package:flutter/material.dart';
import 'package:kalicart/common/utils/app_color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.kGreenColor,
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/widgets/regular_text.dart';

class SubRowTextWidget extends StatelessWidget {
  const SubRowTextWidget({
    super.key, required this.prfixText, required this.suffixText,
  });

  final String prfixText;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RegularTextStyle(size: 16.sp, text: prfixText),
        RegularTextStyle(size: 16.sp, text: '₹$suffixText')
      ],
    );
  }
}
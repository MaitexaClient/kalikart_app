import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/features/search/view/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
      },
      child: Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.kGray),
                  borderRadius: BorderRadius.circular(20.r)),
              child: TextField(
                enabled: false,
                onChanged: (value) {
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon:  FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: AppColor.kblack40,
                    size: 20,
                  ),
                ),
              ),
            ),
    );
  }
}
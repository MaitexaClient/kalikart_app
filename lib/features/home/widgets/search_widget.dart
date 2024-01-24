import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.kGray),
                borderRadius: BorderRadius.circular(20.r)),
            child: TextField(
              onChanged: (value) {
                Provider.of<SearchScreenController>(context, listen: false).getfilterProducts(context, searchQuery: value);
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
          )();
  }
}
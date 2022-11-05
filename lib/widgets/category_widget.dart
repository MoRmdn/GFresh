import "package:flutter/material.dart";
import "package:gfresh/config/app_color.dart";
import 'package:gfresh/models/category.dart';

class CategoryWidget extends StatelessWidget {
  final AppCategory category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const appColor = AppColor.kColorList;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: appColor[int.parse(category.id)],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Text(category.title),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/config/app_assets.dart';
import 'package:gfresh/config/app_string.dart';
import 'package:gfresh/widgets/favorite_widget.dart';

import '../providers/data_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final controller = Get.find<DataProvider>(tag: "main");
  void onRefresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return controller.favoriteProduct().isEmpty
        ? Center(
            child: Image.asset(
              AppAssets.heartIcon,
            ),
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    AppStrings.favoriteTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.favoriteProduct().length,
                    itemBuilder: (context, index) => FavoriteWidget(
                      product: controller.favoriteProduct()[index],
                      onRefresh: onRefresh,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

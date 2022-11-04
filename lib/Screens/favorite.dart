// import 'package:flutter/material.dart';

// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({super.key});

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Icon(Icons.favorite),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "My Favorite",
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

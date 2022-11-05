import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/config/app_string.dart';
import 'package:gfresh/widgets/cart_widget.dart';

import '../providers/data_provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final controller = Get.find<DataProvider>(tag: 'main');

  void onRefresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return controller.getCart.isEmpty
        ? const Center(
            child: Icon(Icons.shopping_cart),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                AppStrings.cartTitle,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.getCart.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      cartItemKey: controller.getCart.keys.toList()[index],
                      product:
                          controller.getCart.values.toList()[index].product!,
                      dPrice: controller.getCart.values
                          .toList()[index]
                          .productPrice
                          .toString(),
                      quantity: controller.getCart.values
                          .toList()[index]
                          .quantity
                          .toString(),
                      onRefresh: onRefresh,
                    );
                  },
                ),
              ),
            ],
          );
  }
}

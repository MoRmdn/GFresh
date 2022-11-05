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
  final controller = Get.find<DataProvider>(tag: AppStrings.mainController);

  void onRefresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return controller.getCart.isEmpty
        ? const Center(
            child: Icon(Icons.shopping_cart),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  AppStrings.cartTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '\$${controller.cartTotal()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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

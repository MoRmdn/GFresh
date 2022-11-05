import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/models/product.dart';

import '../config/app_assets.dart';
import '../config/app_color.dart';
import '../providers/data_provider.dart';

class CartItem extends StatefulWidget {
  final String cartItemKey;
  final Product product;
  final String quantity;
  final String dPrice;
  final VoidCallback onRefresh;
  const CartItem({
    super.key,
    required this.cartItemKey,
    required this.product,
    required this.quantity,
    required this.dPrice,
    required this.onRefresh,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final controller = Get.find<DataProvider>(tag: 'main');
  @override
  Widget build(BuildContext context) {
    final cartKey = widget.cartItemKey;
    final product = widget.product;
    final quantityMe = widget.quantity;
    const appColor = AppColor.kColorList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: appColor[int.parse(product.id) + 5],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                Text('${product.quantity} ${widget.quantity}'),
                Text(
                  '\$ ${product.dPrice}',
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.decreaseCart(cartKey);
                  widget.onRefresh();
                },
                child: Image.asset(AppAssets.decreaseIcon),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quantityMe,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.increaseCart(product);
                  widget.onRefresh();
                },
                child: Image.asset(AppAssets.increaseIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

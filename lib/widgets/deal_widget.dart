import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/config/app_color.dart';
import 'package:gfresh/models/product.dart';

import '../config/app_string.dart';
import '../providers/data_provider.dart';

class DealsOfTheDay extends StatefulWidget {
  final Product product;
  const DealsOfTheDay({
    super.key,
    required this.product,
  });

  @override
  State<DealsOfTheDay> createState() => _DealsOfTheDayState();
}

class _DealsOfTheDayState extends State<DealsOfTheDay> {
  final controller = Get.find<DataProvider>(tag: AppStrings.mainController);
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    const appColor = AppColor.kColorList;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 110,
                decoration: BoxDecoration(
                  color: appColor[int.parse(product.id) + 6],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () => setState(() {
                      product.favorite = !product.favorite;
                    }),
                    icon: Icon(
                      product.favorite
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () => controller.increaseCart(product),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Places${product.places}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(
                    product.address,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: ' \$ ${product.dPrice}   ',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '\$${product.oPrice}',
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

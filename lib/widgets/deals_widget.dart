import 'package:flutter/material.dart';
import 'package:gfresh/config/app_color.dart';
import 'package:gfresh/helpers/helpers.dart';
import 'package:gfresh/models/product.dart';

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
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final size = MediaQuery.of(context).size;
    final appColor = AppColor.kColorList.getRandomValue();
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
                  color: appColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Positioned(
                  left: 0,
                  top: 0,
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
                "Places${product.places}",
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
                            color: Colors.red, fontWeight: FontWeight.bold)),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/widgets/category_widget.dart';
import 'package:gfresh/widgets/deals_widget.dart';

import '../providers/data_provider.dart';
import '../widgets/address_widget.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final controller = Get.find<DataProvider>(tag: "main");
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //* Search bar
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              color: const Color(0xffF5F7F9),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: "Search in Thousands of Products",
              ),
            ),
          ),
          //* Saved Addresses
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: size.width,
              height: size.height * 0.1 < 80 ? 100 : size.height * 0.1,
              child: Obx(
                () {
                  if (controller.isLoading.value == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.getLocation.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => AddressWidget(
                      uLocation: controller.getLocation[index],
                    ),
                  );
                },
              ),
            ),
          ),
          //* Saved Category
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore by Category",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text(
                        "See All",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.13 < 100 ? 120 : size.height * 0.13,
                  child: Obx(
                    () {
                      if (controller.isLoading.value == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                        itemCount: controller.getCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryWidget(
                          category: controller.getCategories[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const DealsOfTheDay(),
        ],
      ),
    );
  }
}

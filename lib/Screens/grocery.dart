import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/config/app_string.dart';
import 'package:gfresh/widgets/category_widget.dart';

import '../providers/data_provider.dart';
import '../widgets/address_widget.dart';
import '../widgets/deal_widget.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final controller = Get.find<DataProvider>(tag: AppStrings.mainController);
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Obx(
        () {
          if (controller.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
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
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: AppStrings.searchTitle,
                  ),
                ),
              ),
              //* Saved Addresses
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.1 < 80 ? 100 : size.height * 0.1,
                  child: ListView.builder(
                    itemCount: controller.getLocation.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => AddressWidget(
                      uLocation: controller.getLocation[index],
                    ),
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
                          AppStrings.categoryTitle,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            AppStrings.seeAll,
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
                      height:
                          size.height * 0.13 < 110 ? 120 : size.height * 0.13,
                      child: ListView.builder(
                        itemCount: controller.getCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryWidget(
                          category: controller.getCategories[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: size.height * 0.18 < 130 ? 130 : size.height * 0.18,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.getProducts.length,
                    itemBuilder: (context, index) => DealsOfTheDay(
                      product: controller.getProducts[index],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: const Color(0xffFEC8BD),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Expanded(flex: 2, child: SizedBox()),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Mega',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'W H O P P',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: Color(0xff21114B),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'E',
                                          style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' R',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xff21114B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' \$17             ',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\$32',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    AppStrings.orderValid,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

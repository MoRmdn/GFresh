import 'dart:developer';

import 'package:get/get.dart';
import 'package:gfresh/helpers/remote_services.dart';
import 'package:gfresh/models/category.dart';
import 'package:gfresh/models/product.dart';

import '../models/location.dart';

class DataProvider extends GetxController {
  var isLoading = true.obs;
  List<Product> _products = [];
  List<AppCategory> _categories = [];
  List<UserLocation> _userLocations = [];

  void fetchData() async {
    try {
      isLoading(true);
      _userLocations = await RemoteServices.fetchLocations();
      _products = await RemoteServices.fetchProduct();
      _categories = await RemoteServices.fetchCategory();
    } finally {
      log("Loaded");
      isLoading(false);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  List<UserLocation> get getLocation => _userLocations;
  List<AppCategory> get getCategories => _categories;
  List<Product> get getProducts => _products;
}

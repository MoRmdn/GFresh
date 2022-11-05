import 'dart:developer';

import 'package:get/get.dart';
import 'package:gfresh/helpers/remote_services.dart';
import 'package:gfresh/models/cart_item.dart';
import 'package:gfresh/models/category.dart';
import 'package:gfresh/models/product.dart';

import '../models/location.dart';

class DataProvider extends GetxController {
  var isLoading = true.obs;
  List<Product> _products = [];
  List<AppCategory> _categories = [];
  List<UserLocation> _userLocations = [];
  final Map<String, CartItem> _cart = {};

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

  List<Product> favoriteProduct() {
    List<Product> favProduct = [];
    for (var element in _products) {
      isLoading(true);
      if (element.favorite) {
        favProduct.add(element);
      }
    }
    isLoading(false);
    return favProduct;
  }

  void increaseCart(Product product) {
    if (_cart.containsKey(product)) {
      _cart.update(
          product.id,
          (existingItem) => CartItem(
                id: existingItem.id,
                product: existingItem.product,
                productPrice: existingItem.productPrice,
                quantity: existingItem.quantity + 1,
              ));
    } else {
      _cart.putIfAbsent(
          product.id,
          () => CartItem(
              id: product.id,
              product: product,
              productPrice: product.oPrice,
              quantity: 1));
    }
  }

  void decreaseCart(CartItem cart) {
    if (cart.quantity == 1) {
      _cart.remove(cart.id);
    } else {
      _cart.update(
          cart.id,
          (existingItem) => CartItem(
                id: existingItem.id,
                product: existingItem.product,
                productPrice: existingItem.productPrice,
                quantity: existingItem.quantity - 1,
              ));
    }
  }

  void removeFormCart(CartItem cart) {
    _cart.remove(cart.id);
  }

  double cartTotal() {
    double sum = 0;
    _cart.forEach((key, value) {
      sum += (value.quantity * value.productPrice);
    });
    return sum;
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

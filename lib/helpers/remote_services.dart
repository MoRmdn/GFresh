import 'dart:io';

import 'package:gfresh/config/app_string.dart';
import 'package:gfresh/models/category.dart';
import 'package:gfresh/models/location.dart';
import 'package:gfresh/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProduct() async {
    var response = await client.get(
      Uri.parse(
        Platform.isAndroid
            ? AppStrings.productApiForAndroid
            : AppStrings.productApi,
      ),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<AppCategory>> fetchCategory() async {
    var response = await client.get(
      Uri.parse(
        Platform.isAndroid
            ? AppStrings.categoryApiForAndroid
            : AppStrings.categoryApi,
      ),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return catFromJson(jsonString);
    } else {
      return [];
    }
  }

  static Future<List<UserLocation>> fetchLocations() async {
    var response = await client.get(
      Uri.parse(
        Platform.isAndroid
            ? AppStrings.addressApiForAndroid
            : AppStrings.addressApi,
      ),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return locationFromJson(jsonString);
    } else {
      return [];
    }
  }
}

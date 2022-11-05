import 'package:get/get.dart';
import 'package:gfresh/providers/data_provider.dart';

import '../config/app_string.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(
      () => DataProvider(),
      tag: AppStrings.mainController,
    );
  }
}

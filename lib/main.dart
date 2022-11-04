import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/home_page.dart';
import 'helpers/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GFresh',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialBinding: StoreBinding(),
      initialRoute: '/home',
      getPages: [
        // Pages route
        GetPage(name: '/home', page: () => const MyHomePage()),
      ],
    );
  }
}

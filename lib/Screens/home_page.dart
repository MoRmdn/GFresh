import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfresh/Screens/cart_screen.dart';
import 'package:gfresh/Screens/favorite.dart';
import 'package:gfresh/Screens/grocery.dart';
import 'package:gfresh/Screens/news.dart';
import 'package:gfresh/config/app_assets.dart';
import 'package:gfresh/config/app_string.dart';

import '../providers/data_provider.dart';
import '../widgets/custom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.find<DataProvider>(tag: AppStrings.mainController);

  int _selectedIndex = 0;
  // final controller = Get.put<DataProvider>(DataProvider(), tag: "main");
  void _onItemTapped(int index) => setState(() {
        _selectedIndex = index;
      });

  List<Widget> pages = [
    const GroceryScreen(),
    const NewsScreen(),
    const FavoriteScreen(),
    const MyCart(),
  ];

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(),
      body: pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          //ToDo
          //code to execute on button press
        },
        child: Stack(
          children: [
            const ImageIcon(
              AssetImage(
                AppAssets.fabIcon,
              ),
            ),
            if (controller.cartTotal() != 0)
              Positioned(
                left: 0,
                child: Text(
                  '${controller.cartTotal().toStringAsFixed(0)}\$',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
          ],
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.redAccent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.homeIcon,
                ),
              ),
              label: AppStrings.grocery,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.newsIcon,
                ),
              ),
              label: AppStrings.newsTile,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  AppAssets.heartIcon,
                ),
              ),
              label: AppStrings.favoriteTitle,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: AppStrings.cartTitle,
            ),
          ],
          // selectedFontSize: 18,
          // unselectedFontSize: 18,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedItemColor: Colors.redAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

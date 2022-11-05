import 'package:flutter/material.dart';

import '../config/app_assets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.newsIcon,
      ),
    );
  }
}

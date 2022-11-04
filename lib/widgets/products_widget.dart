import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gfresh/models/product.dart';

class ProductsWidget extends StatefulWidget {
  final Product product;
  const ProductsWidget({super.key, required this.product});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

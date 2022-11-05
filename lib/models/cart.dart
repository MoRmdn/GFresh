import 'package:gfresh/models/product.dart';

class Cart {
  final String id;
  final Product? product;
  final int productPrice;
  int quantity;
  Cart({
    required this.id,
    required this.product,
    required this.productPrice,
    required this.quantity,
  });

  Cart.empty()
      : id = 'empty',
        productPrice = 0,
        product = null,
        quantity = 0;

  @override
  String toString() => {
        'id': id,
        'product': product,
        'quantity': quantity,
      }.toString();
}

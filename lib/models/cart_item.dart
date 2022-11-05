import 'package:gfresh/models/product.dart';

class CartItem {
  final String id;
  final Product? product;
  final int productPrice;
  int quantity;
  CartItem({
    required this.id,
    required this.product,
    required this.productPrice,
    required this.quantity,
  });

  CartItem.empty()
      : id = "empty",
        productPrice = 0,
        product = null,
        quantity = 0;

  @override
  String toString() => {
        "id": id,
        "product": product,
        "quantity": quantity,
      }.toString();
}

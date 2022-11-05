// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:gfresh/models/cart.dart';
import 'package:test/test.dart';

final Map<String, Cart> mocCart = {
  "1": Cart(id: '1', product: null, productPrice: 10, quantity: 1),
  "2": Cart(id: '2', product: null, productPrice: 20, quantity: 2),
  "3": Cart(id: '3', product: null, productPrice: 30, quantity: 1),
  "4": Cart(id: '4', product: null, productPrice: 40, quantity: 2)
};

double cartTotal() {
  double sum = 0;
  mocCart.forEach((key, value) {
    sum += (value.quantity * value.productPrice);
  });
  return sum;
}

void main() {
  group('testTotalCartMethod', () {
    test(
      'Zero is an Armstrong number',
      () {
        final double result = cartTotal();
        expect(result, equals(160));
      },
      skip: false,
    );
  });
}

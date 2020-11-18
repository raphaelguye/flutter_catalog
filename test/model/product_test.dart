import 'package:flutter_catalog/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product', () {

    test('toString', () {
      // Given
      Product product = Product('1', 'product name', 'product description', 42.42, 'chf');

      // When
      String stringProduct = product.toString();

      // Then
      expect(stringProduct, 'Product(id: 1, name: product name, desc: product description, price: 42.42, currency: chf)');
    });

  });
}
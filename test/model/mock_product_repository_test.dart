import 'package:flutter_catalog/model/mock_product_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MockProductsRepository', () {

    test('loadProducts', () async {
      // Given
      var repository = MockProductsRepository();

      // When
      var products = await repository.loadProducts();

      // Then
      expect(products.length, 5);
    });

  });
}
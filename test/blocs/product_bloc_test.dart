import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_catalog/blocs/product/product.dart';
import 'package:flutter_catalog/model/product.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('ProductBloc', () {
    Product product = Product(
        '1', 'product1', 'desc product1', 10.10, 'chf', Icon(Icons.ac_unit));

    //TODO: Create and inject a ProductService in the ProductBlock to mock the 'random' logic
    blocTest(
      'LoadProduct -> ProductLoaded',
      build: () {
        return ProductBloc(ProductLoading());
      },
      act: (ProductBloc bloc) async => bloc.add(LoadProduct(product)),
      expect: <ProductState>[ProductLoaded(product)],
    );
  });
}

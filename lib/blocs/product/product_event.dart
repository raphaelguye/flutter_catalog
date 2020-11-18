import 'package:flutter_catalog/model/product.dart';

abstract class ProductEvent {
  const ProductEvent();
}

class LoadProduct extends ProductEvent {
  final Product product;
  const LoadProduct(this.product);
}
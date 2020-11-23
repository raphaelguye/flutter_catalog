import 'package:equatable/equatable.dart';
import 'package:flutter_catalog/model/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductNotLoaded extends ProductState {
  // We should receive only the product id instead of the whole Entity
  final Product product;
  const ProductNotLoaded(this.product);
}

class ProductLoaded extends ProductState {
  // We should receive only the product id instead of the whole Entity
  final Product product;
  const ProductLoaded(this.product);
}

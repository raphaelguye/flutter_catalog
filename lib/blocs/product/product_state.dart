import 'package:equatable/equatable.dart';
import 'package:flutter_catalog/model/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductNotLoaded extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;
  const ProductLoaded(this.product);
}

import 'package:equatable/equatable.dart';
import 'package:flutter_catalog/model/product.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {}
class ProductsNotLoaded extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded(this.products);
}

class ProductAdded extends ProductsState {}
class ProductUpdated extends ProductsState {}
class ProductDeleted extends ProductsState {}

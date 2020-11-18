import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/products/products.dart';
import 'package:flutter_catalog/model/product_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc(
      ProductsState initialState, this.productsRepository)
      : super(initialState);

  @override
  Stream<ProductsState> mapEventToState(event) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProducts();
    }
    if (event is AddProduct) {
      yield* _mapAddProduct();
    }
    if (event is UpdateProduct) {
      yield* _mapUpdateProduct();
    }
    if (event is DeleteProduct) {
      yield* _mapDeleteProduct();
    }
  }

  Stream<ProductsState> _mapLoadProducts() async* {
    try {
      final products = await productsRepository.loadProducts();
      yield ProductsLoaded(products);
    } catch (e) {
      print('error when trying to load products: $e');
      yield ProductsNotLoaded();
    }
  }

  Stream<ProductsState> _mapAddProduct() async* {
    await new Future.delayed(const Duration(seconds: 3));
    yield ProductAdded();
  }

  Stream<ProductsState> _mapUpdateProduct() async* {
    await new Future.delayed(const Duration(seconds: 3));
    yield ProductUpdated();
  }

  Stream<ProductsState> _mapDeleteProduct() async* {
    await new Future.delayed(const Duration(seconds: 3));
    yield ProductDeleted();
  }
}

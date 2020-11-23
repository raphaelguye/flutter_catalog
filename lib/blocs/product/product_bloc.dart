import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/product/product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductState initialState) : super(initialState);

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProduct(event);
    }
  }

  Stream<ProductState> _mapLoadProduct(LoadProduct event) async* {
    try {
      yield ProductLoading();
      var random = new Random().nextInt(2);
      await Future.delayed(const Duration(milliseconds: 500));
      if (random.isEven) {
        yield ProductLoaded(event.product);
      } else {
        throw new Exception('the chance was not with you...');
      }
    } catch (e) {
      print('error when trying to load product: $e');
      yield ProductNotLoaded(event.product);
    }
  }
}

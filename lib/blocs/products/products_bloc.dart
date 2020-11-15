

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter_catalog/blocs/products/products.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  @override
  get initialState => ProductsLoading();

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}
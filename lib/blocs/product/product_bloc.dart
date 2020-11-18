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
      yield ProductLoaded(event.product);
    } catch(e) {
      print('error when trying to load product: $e');
      yield ProductNotLoaded();
    }
  }
}

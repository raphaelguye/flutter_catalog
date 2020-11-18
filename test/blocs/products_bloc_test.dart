import 'package:flutter_catalog/blocs/products/products.dart';
import 'package:flutter_catalog/blocs/products/products_bloc.dart';
import 'package:flutter_catalog/model/mock_product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('ProductsBloc', () {
    MockProductsRepository productsRepository;

    setUp(() {
      productsRepository = MockProductsRepository();
      when(productsRepository.loadProducts().then((_) => Future.value([])));
    });

    blocTest(
      'LoadProducts -> ProductsLoaded',
      build: () {
        return ProductsBloc(ProductsLoading(), productsRepository);
      },
      act: (ProductsBloc bloc) async => bloc.add(LoadProducts()),
      expect: <ProductsState>[ProductsLoaded([])],
    );

    blocTest(
      'AddProduct -> ProductsLoaded',
      build: () {
        return ProductsBloc(ProductsLoading(), productsRepository);
      },
      act: (ProductsBloc bloc) async => bloc.add(AddProduct()),
      expect: <ProductsState>[ProductAdded()],
    );

    blocTest(
      'UpdateProduct -> ProductsLoaded',
      build: () {
        return ProductsBloc(ProductsLoading(), productsRepository);
      },
      act: (ProductsBloc bloc) async => bloc.add(UpdateProduct()),
      expect: <ProductsState>[ProductUpdated()],
    );

    blocTest(
      'DeleteProduct -> ProductsLoaded',
      build: () {
        return ProductsBloc(ProductsLoading(), productsRepository);
      },
      act: (ProductsBloc bloc) async => bloc.add(DeleteProduct()),
      expect: <ProductsState>[ProductDeleted()],
    );
  });
}

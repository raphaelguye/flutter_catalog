import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/product/product.dart';
import 'package:flutter_catalog/model/product.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (
      BuildContext context,
      ProductState state,
    ) {
      if (state is ProductLoading) {
        return _loadingIndicator;
      } else if (state is ProductNotLoaded) {
        return _loadingErrorWidget;
      } else if (state is ProductLoaded) {
        return _productDetail(state.product);
      } else {
        return Center(child: Text('The state is : $state'));
      }
    });
  }

  Widget get _loadingIndicator {
    return Center(child: CircularProgressIndicator());
  }

  Widget get _loadingErrorWidget {
    return Center(
        child: Text(
            'ERROR: Something went wrong during the loading of the product'));
  }

  Widget _productDetail(Product product) {
    return Row(
      children: [
        Spacer(),
        Column(children: [
          product.icon,
          Text(product.name),
          Text(product.description),
          Text(product.priceCurrencyFormatted)
        ], mainAxisAlignment: MainAxisAlignment.center),
        Spacer()
      ],
    );
  }
}

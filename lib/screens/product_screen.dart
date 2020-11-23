import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/product/product.dart';
import 'package:flutter_catalog/model/product.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (
        BuildContext context,
        ProductState state,
      ) {
        if (state is ProductLoading) {
          return _loadingIndicator;
        } else if (state is ProductNotLoaded) {
          return _loadingErrorWidget(context, state.product);
        } else if (state is ProductLoaded) {
          return _productDetail(state.product);
        } else {
          return Center(child: Text('The state is : $state'));
        }
      }),
    );
  }

  Widget get _loadingIndicator {
    return Center(child: CircularProgressIndicator());
  }

  Widget _loadingErrorWidget(BuildContext context, Product product) {
    return Row(children: [
      Flexible(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Text('ERROR: Something went wrong during the loading of the product'),
              product != null
                  ? FlatButton(
                      onPressed: () {
                        final productBloc = BlocProvider.of<ProductBloc>(context);
                        productBloc.add(LoadProduct(product));
                      },
                      child: Text("Try again!"))
                  : null
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    ]);
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

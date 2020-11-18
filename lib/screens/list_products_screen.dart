import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/product/product.dart';
import 'package:flutter_catalog/blocs/products/products.dart';
import 'package:flutter_catalog/model/product.dart';
import 'package:flutter_catalog/screens/product_screen.dart';

class ListProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (
      BuildContext context,
      ProductsState state,
    ) {
      if (state is ProductsLoading) {
        return _loadingIndicator;
      } else if (state is ProductsNotLoaded) {
        return _loadingErrorWidget;
      } else if (state is ProductsLoaded) {
        return _productsList(state.products);
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
            'ERROR: Something went wrong during the loading of the products'));
  }

  Widget _productsList(List<Product> products) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return _productTile(products[index], context);
        });
  }

  Widget _productTile(Product product, BuildContext context) {
    return ListTile(
      leading: product.icon,
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: Text(product.priceCurrencyFormatted),
      onTap: () {
        print('product ${product.id} selected');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider<ProductBloc>(
              create: (context) =>
                  ProductBloc(ProductLoading())..add(LoadProduct(product)),
              child: Scaffold(
                appBar: AppBar(title: Text('Product Detail')),
                body: ProductScreen(),
              ));
        }));
      },
    );
  }
}

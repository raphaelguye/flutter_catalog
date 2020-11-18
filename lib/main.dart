import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_catalog/blocs/products/products.dart';
import 'package:flutter_catalog/model/mock_product_repository.dart';
import 'package:flutter_catalog/screens/list_products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider<ProductsBloc>(
          create: (context) =>
              ProductsBloc(ProductsLoading(), MockProductsRepository())
                ..add(LoadProducts()),
          child: Scaffold(
            appBar: AppBar(title: Text('Flutter Catalog')),
            body: ListProductScreen(),
          ),
        ));
  }
}

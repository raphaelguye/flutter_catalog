
import 'package:flutter_catalog/model/product.dart';

abstract class ProductsRepository {

  Future<List<Product>> loadProducts();

}
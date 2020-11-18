
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final Icon icon;

  Product(this.id, this.name, this.description, this.price, this.currency, this.icon);

  String get priceCurrencyFormatted {
    return '$currency $price';
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $description, price: $price, currency: $currency)';
  }

}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;

  Product(this.id, this.name, this.description, this.price, this.currency);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, desc: $description, price: $price, currency: $currency)';
  }

}
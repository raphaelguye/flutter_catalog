abstract class ProductsEvent {
  const ProductsEvent();
}

class LoadProducts extends ProductsEvent {}
class AddProduct extends ProductsEvent {}
class UpdateProduct extends ProductsEvent {}
class DeleteProduct extends ProductsEvent {}
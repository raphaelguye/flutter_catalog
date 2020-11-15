abstract class ProductsState {
  const ProductsState();
}

class ProductsLoading extends ProductsState {}
class ProductsLoaded extends ProductsState {}
class ProductsNotLoaded extends ProductsState {}
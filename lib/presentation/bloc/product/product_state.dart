part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;

  const ProductSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductState {
  final String error;

  const ProductError(this.error);

  @override
  List<Object> get props => [error];
}

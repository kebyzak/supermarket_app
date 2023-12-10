// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:supermarket_app/data/services/product_repository.dart';
import 'package:supermarket_app/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<FetchProducts>((event, state) async {
      emit(ProductLoading());
      try {
        final List<Product> products = await productRepository.getProducts();
        emit(ProductSuccess(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}

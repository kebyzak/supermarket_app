import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:supermarket_app/domain/entities/product.dart';

part 'product_repository.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ProductRepository {
  factory ProductRepository(Dio dio, {String baseUrl}) = _ProductRepository;

  @GET('/products')
  Future<List<Product>> getProducts();
}

import '../network/network_response.dart';

abstract class IProductRepository {
  Future<NetworkResponse> fetchProducts();
}

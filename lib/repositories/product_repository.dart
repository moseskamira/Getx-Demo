import 'package:dio/dio.dart';
import 'package:get_x_app/interfaces/iproduct_repository.dart';
import 'package:get_x_app/network/network_response.dart';
import '../retrofit/api_client.dart';
import '../retrofit/logger_interceptor.dart';
import '../utils/constants.dart';

class ProductRepository implements IProductRepository {
  ApiClient? _apiRequest;
  Dio? dio;

  ProductRepository() {
    dio = Dio(
      BaseOptions(
        contentType: "application/json",
        baseUrl: Constants.baseUrl,
      ),
    );
    dio?.interceptors.add(LoggerInterceptor());
    _apiRequest = ApiClient(dio: dio!);
  }

  @override
  Future<NetworkResponse> fetchProducts(String query) async {
    var res = await _apiRequest?.getProducts(query);
    return NetworkResponse(true, data: res);
  }
}

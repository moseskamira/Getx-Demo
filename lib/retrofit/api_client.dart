import 'package:dio/dio.dart';
import 'package:get_x_app/retrofit/apis.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient({required Dio dio}) => _ApiClient(dio);

  @GET(Apis.products)
  Future<dynamic> getProducts(@Query('brand') String brand);
}

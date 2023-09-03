import 'package:get/get.dart';
import 'package:get_x_app/controllers/product_controller.dart';

class AppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}

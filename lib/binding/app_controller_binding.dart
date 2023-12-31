import 'package:get/get.dart';
import 'package:get_x_app/controllers/image_controller.dart';
import 'package:get_x_app/controllers/network_controller.dart';

class AppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ImageController>(() => ImageController());
  }
}

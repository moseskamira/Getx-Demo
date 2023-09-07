import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_x_app/models/product.dart';
import '../repositories/product_repository.dart';
import '../utils/toast_message.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  late ProductRepository productRepository;
  List<Product> productList = List<Product>.empty(growable: true).obs;
  var scrollPositionMessage = ''.obs;
  var scrollNotificationMessage = ''.obs;
  late ScrollController scrollController;

  void initializeScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollPositionMessage.value = 'Reached Bottom';
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollPositionMessage.value = 'Reached Top';
      }
    });
  }

  @override
  void onInit() {
    fetchProducts();
    initializeScrollController();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      productRepository = ProductRepository();
      final response = await productRepository.fetchProducts('colourpop');
      if (response.success) {
        final dynamicRespData = response.data;
        List<Product> prodList = dynamicRespData
            .map<Product>((product) => Product.fromJson(product))
            .toList();
        productList.assignAll(prodList);
      } else {
        showSnackBar('Something went wrong', error: true);
      }
    } on DioException catch (res, _) {
      showSnackBar('${res.response?.data['error']}', error: true);
    } finally {
      isLoading(false);
    }
  }
}

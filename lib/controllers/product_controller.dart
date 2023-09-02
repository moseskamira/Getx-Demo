import 'package:get/get.dart';
import 'package:get_x_app/models/product.dart';
import '../repositories/product_repository.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  late ProductRepository productRepository;

  List<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      productRepository = ProductRepository();
      isLoading(true);
      final response = await productRepository.fetchProducts('colourpop');
      if (response.success) {
        final dynamicRespData = response.data;
        List<Product> prodList = dynamicRespData
            .map<Product>((product) => Product.fromJson(product))
            .toList();
        productList.assignAll(prodList);
      } else {}
    } finally {
      isLoading(false);
    }
  }
}

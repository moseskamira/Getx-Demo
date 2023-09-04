import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/product_controller.dart';
import '../widget/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (Get.find<ProductController>().isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(Get.find<ProductController>().productList.isNotEmpty) {
          return ListView.builder(
            itemCount: Get.find<ProductController>().productList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed('/product_details',
                      arguments:
                          Get.find<ProductController>().productList[index]);
                },
                child: ProductCard(
                  product: Get.find<ProductController>().productList[index],
                ),
              );
            },
          );
        }else{
          return const Center(child: Text('No Products Found'));
        }
      }),
    );
  }
}

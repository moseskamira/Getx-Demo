import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/product_controller.dart';

class MyHomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Demo'),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (context, index) {
              return Text('${productController.productList[index].name}');
            },
          );
        }
      }),
    );
  }
}

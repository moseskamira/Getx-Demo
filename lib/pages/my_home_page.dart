import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/product_controller.dart';

import '../widget/product_card.dart';

class MyHomePage extends StatelessWidget {
  final ProductController productController;

  const MyHomePage({super.key, required this.productController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GETX DEMO'),
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
              return ProductCard(product: productController.productList[index]);
            },
          );
        }
      }),
    );
  }
}

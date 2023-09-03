import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/product_controller.dart';
import '../widget/product_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GETX DEMO'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (Get.find<ProductController>().isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: Get.find<ProductController>().productList.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: Get.find<ProductController>().productList[index],
              );
            },
          );
        }
      }),
    );
  }
}

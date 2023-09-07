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
        } else if (Get.find<ProductController>().productList.isNotEmpty) {
          return Column(
            children: [
              Text(
                Get.find<ProductController>().scrollPositionMessage.value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Get.find<ProductController>().scrollNotificationMessage.value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollStartNotification) {
                      Get.find<ProductController>()
                          .scrollNotificationMessage
                          .value = 'Scroll Started';
                    } else if (scrollNotification is ScrollUpdateNotification) {
                      Get.find<ProductController>()
                          .scrollNotificationMessage
                          .value = 'Scroll Updated';
                    } else if (scrollNotification is ScrollEndNotification) {
                      Get.find<ProductController>()
                          .scrollNotificationMessage
                          .value = 'Scroll Ended';
                    }
                    return true;
                  },
                  child: ReorderableListView.builder(
                    itemCount: Get.find<ProductController>().productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        key: ValueKey(
                          Get.find<ProductController>().productList[index],
                        ),
                        onTap: () {
                          Get.toNamed('/product_details',
                              arguments: Get.find<ProductController>()
                                  .productList[index]);
                        },
                        child: ProductCard(
                          product:
                              Get.find<ProductController>().productList[index],
                        ),
                      );
                    },
                    onReorder: (int oldIndex, int newIndex) {
                      Get.find<ProductController>()
                          .reorderProductList(oldIndex, newIndex);
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No Products Found'));
        }
      }),
    );
  }
}

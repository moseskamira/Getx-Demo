import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/network_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Demo App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              Get.find<NetworkController>().connectionStatus.value == 1
                  ? 'You are using:WI FI'
                  : Get.find<NetworkController>().connectionStatus.value == 2
                      ? 'You are using:Mobile Data'
                      : '${Get.find<NetworkController>().connectionStatus.value}',
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/products');
              },
              child: const Text('SHOW PRODUCTS'),
            ),
          )
        ],
      ),
    );
  }
}

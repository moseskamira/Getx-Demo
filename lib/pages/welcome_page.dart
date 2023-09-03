import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'products_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GETX DEMO APP'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/products', arguments: 'Products List');
              },
              child: Text('SHOW PRODUCTS'),
            ),
          )
        ],
      ),
    );
  }
}

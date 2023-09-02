import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/pages/my_home_page.dart';
import 'controllers/product_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(productController: productController),
    );
  }
}

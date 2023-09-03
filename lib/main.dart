import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/binding/app_controller_binding.dart';
import 'package:get_x_app/pages/product_details_page.dart';
import 'package:get_x_app/pages/products_page.dart';
import 'package:get_x_app/pages/welcome_page.dart';

import 'binding/product_controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //initialBinding: AppControllerBinding(),
      title: 'GETX Demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(
          name: '/products',
          page: () => const ProductsPage(),
          transition: Transition.leftToRight,
          binding: ProductControllerBinding(),
        ),
        GetPage(
          name: '/product_details',
          page: () => const ProductDetailsPage(),
          transition: Transition.leftToRight,
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}

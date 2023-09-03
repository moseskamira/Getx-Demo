import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/app_controller_binding.dart';
import 'package:get_x_app/pages/product_details_page.dart';
import 'package:get_x_app/pages/products_page.dart';
import 'package:get_x_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppControllerBinding(),
      title: 'Getx Demo',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyApp()),
        GetPage(
          name: '/products',
          page: () => const ProductsPage(),
          transition: Transition.leftToRight,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/app_controller_binding.dart';
import 'package:get_x_app/pages/my_home_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

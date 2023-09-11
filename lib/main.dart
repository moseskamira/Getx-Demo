import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/binding/app_controller_binding.dart';
import 'package:get_x_app/pages/welcome_page.dart';
import 'package:get_x_app/routes/app_pages.dart';

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
      title: 'GetX Demo',
      initialRoute: '/',
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}

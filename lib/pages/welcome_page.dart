import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/image_controller.dart';
import 'package:get_x_app/controllers/network_controller.dart';
import 'package:image_picker/image_picker.dart';

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
            () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        Get.find<NetworkController>().connectionStatus.value ==
                                1
                            ? 'You are using: WI FI'
                            : Get.find<NetworkController>()
                                        .connectionStatus
                                        .value ==
                                    2
                                ? 'You are using: Mobile Data'
                                : '${Get.find<NetworkController>().connectionStatus.value}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.find<ImageController>().getImage(ImageSource.camera);
              },
              child: const Text('GAMERA'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.find<ImageController>().getImage(ImageSource.gallery);
              },
              child: const Text('GALLERY'),
            ),
          ),
          Obx(
            () => Get.find<ImageController>().selectedImagePath.isEmpty
                ? const Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )
                : Image.file(
                    File(Get.find<ImageController>().selectedImagePath.value),
                    width: 200,
                    height: 100,
                  ),
          ),
          Obx(
            () => Get.find<ImageController>().selectedImageSize.isEmpty
                ? const Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )
                : Text(Get.find<ImageController>().selectedImageSize.value),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/products');
              },
              child: const Text('SHOW PRODUCTS'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/biometrics');
              },
              child: const Text('SHOW BIOMETRIC SCREEN'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/signIn');
              },
              child: const Text('SHOW FORM'),
            ),
          ),
        ],
      ),
    );
  }
}

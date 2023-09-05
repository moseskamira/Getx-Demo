import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/image_controller.dart';
import 'package:get_x_app/controllers/network_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/biometrics_controller.dart';

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
            () => Get.find<ImageController>().selectedImagePath == ''
                ? Text('No Image Selected')
                : Image.file(
                    File(Get.find<ImageController>().selectedImagePath.value),
                  ),
          ),
          Obx(
            () => Text(Get.find<ImageController>().selectedImageSize == ''
                ? ''
                : Get.find<ImageController>().selectedImageSize.value),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    Get.find<NetworkController>().connectionStatus.value == 1
                        ? 'You are using: WI FI'
                        : Get.find<NetworkController>()
                                    .connectionStatus
                                    .value ==
                                2
                            ? 'You are using: Mobile Data'
                            : '${Get.find<NetworkController>().connectionStatus.value}',
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Get.find<BiometricsController>().hasFingerPrintLock.value
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                  const Text('Finger Print Authentication'),
                ],
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Get.find<BiometricsController>().hasFaceLock.value
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                  const Text('FaceLock Authentication'),
                ],
              ),
            ),
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.find<BiometricsController>().authenticateUser();
              },
              child: const Text('BIOMETRIC'),
            ),
          ),
        ],
      ),
    );
  }
}

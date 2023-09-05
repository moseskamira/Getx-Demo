import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/controllers/biometrics_controller.dart';

class BiometricPage extends GetView<BiometricsController> {
  const BiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BiometricsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                controller.authenticateUser();
              },
              child: const Text('VERIFY IDENTITY'),
            ),
          ),
        ],
      ),
    );
  }
}

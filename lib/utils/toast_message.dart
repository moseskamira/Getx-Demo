import 'package:flutter/material.dart';
import 'package:get/get.dart' as my_get_x;
import 'package:get/get_navigation/get_navigation.dart';

void showSnackBar(String message, {bool error = false}) {
  my_get_x.Get.snackbar(
    "",
    "",
    titleText: Container(),
    messageText: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    ),
    borderRadius: 0,
    margin: const EdgeInsets.all(0),
    padding: const EdgeInsets.all(5),
    backgroundColor: error ? Colors.red : Colors.blue,
    duration: const Duration(seconds: 5),
    snackPosition: SnackPosition.BOTTOM,
  );
}

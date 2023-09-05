import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';

class FormController extends GetxController {
  late TextEditingController emailController, passwordController;
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  late String email;
  late String password;

  void checkForm() {
    if (signInFormKey.currentState!.validate()) {
      signInFormKey.currentState!.save();
      email = emailController.text.trim();
      password = passwordController.text.trim();
      print('EMAIL: $email');
      print('PASSWORD: $password');
      showSnackBar('Form Validated Successfully', error: false);
    } else {
      return;
    }
  }

  String? validateFormInPuts(String input, TextInputType inputType) {
    if (inputType == TextInputType.emailAddress) {
      if (!GetUtils.isEmail(input)) {
        return 'Provide a valid emailAddress';
      } else {
        return null;
      }
    } else if (inputType == TextInputType.visiblePassword) {
      if (input.length < 6) {
        return 'Password MUST contain more than 5 characters';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}

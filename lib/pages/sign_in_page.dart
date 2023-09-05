import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';

class SignInPage extends GetView<FormController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FormController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('FORM VALIDATION WITH GETX'),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: Form(
              key: controller.signInFormKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return controller.validateFormInPuts(
                            value!.trim(), TextInputType.emailAddress);
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return controller.validateFormInPuts(
                            value!.trim(), TextInputType.visiblePassword);
                      },
                    ),
                    const SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: Get.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
                        ),
                        onPressed: () {
                          controller.checkForm();
                        },
                        child: const Text('Submit'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

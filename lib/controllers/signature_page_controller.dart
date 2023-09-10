import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:signature/signature.dart';

class SignaturePageController extends GetxController {
  late SignatureController signatureController;
  var padColor = Colors.black.obs;
  var penColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();
    initializeSignatureController();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    signatureController.dispose();
  }

  void initializeSignatureController() {
    signatureController = SignatureController(
      penColor: penColor.value,
      penStrokeWidth: 5,
    );
  }

  void selectPadColor() {
    Get.dialog(
      Center(
        child: Dialog(
          child: ColorPicker(
            pickerColor: padColor.value,
            onColorChanged: (Color value) {
              padColor.value = value;
            },
            pickerAreaHeightPercent: .8,
            pickerAreaBorderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void selectPenColor() {
    Get.dialog(
      Center(
        child: Dialog(
          child: ColorPicker(
            pickerColor: penColor.value,
            onColorChanged: (Color value) {
              penColor.value = value;
              initializeSignatureController();
            },
            pickerAreaHeightPercent: .8,
            pickerAreaBorderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void clearSignature() {
    signatureController.clear();
  }

  void exportSignature() async {
    if (signatureController.isNotEmpty) {
      final exportedSignature = SignatureController(
        penColor: penColor.value,
        penStrokeWidth: 5,
        exportBackgroundColor: padColor.value,
        points: signatureController.points,
      );
      final signature = await exportedSignature.toPngBytes();
      exportedSignature.dispose();
      final result = await ImageGallerySaver.saveImage(
          name: 'mysignature.png', signature!);
      final isExported = result['isSuccess'];
      if (isExported) {
        showSnackBar('Signature Exported Successfully', error: false);
      } else {
        showSnackBar('Signature Not Exported', error: true);
      }
    } else {
      showSnackBar('Provide Signature', error: true);
    }
  }
}

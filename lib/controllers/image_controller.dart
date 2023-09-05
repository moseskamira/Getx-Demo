import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_x_app/utils/toast_message.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var croppedImagePath = ''.obs;
  var compressedImagePath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    try {
      if (pickedImage != null) {
        selectedImagePath.value = pickedImage.path;
        selectedImageSize.value =
            '${((File(selectedImagePath.value)).lengthSync() / 1024).toStringAsFixed(2)}kb';
        // final croppedImageFile = await ImageCropper().cropImage(
        //   sourcePath: selectedImagePath.value,
        //   maxHeight: 100,
        //   maxWidth: 100,
        //   compressFormat: ImageCompressFormat.jpg,
        // );
        // if (croppedImageFile != null) {
        //   croppedImagePath.value = croppedImageFile.path;
        // }
      } else {
        showSnackBar('No Image Selected', error: true);
      }
    } on PlatformException catch (e) {
      showSnackBar(e.toString(), error: true);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

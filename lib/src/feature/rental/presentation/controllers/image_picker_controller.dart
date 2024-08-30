import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends ChangeNotifier {
  final ImagePicker imagePicker;

  ImagePickerController({required this.imagePicker});

  List<XFile?> imageFileList = [];

  void pickImage() async {
    int limit = 5 - imageFileList.length;
    List<XFile> selectedImages = [];
    if (limit != 1) {
      selectedImages = await imagePicker.pickMultiImage(limit: limit);
    } else {
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) selectedImages.add(image);
    }
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      notifyListeners();
    }
    log("Image List Length:${imageFileList.length}");
  }

  void removeSelectedImages(XFile? file) {
    imageFileList.remove(file);
    notifyListeners();
  }
  void clearSelectedImages() {
    imageFileList.clear();
    notifyListeners();
  }
}

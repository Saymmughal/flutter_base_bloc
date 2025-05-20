import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/router_navigator.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/utils/colors.dart';
import 'package:flutter_base_bloc/utils/constant.dart';
import 'package:flutter_base_bloc/view/widgets/cross_button.dart';
import 'package:flutter_base_bloc/view/widgets/custom_snackbar.dart';
import 'package:flutter_base_bloc/view/widgets/extention/int_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/string_extension.dart';
import 'package:flutter_base_bloc/view/widgets/extention/widget_extension.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static void showPicker(void Function(File? image) onPressed) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(33),
            topRight: Radius.circular(33),
          ),
        ),
        backgroundColor: whitePrimary,
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              CrossButton().paddingSymmetric(horizontal: 16.w, vertical: 24.h),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Constant.galleryText.to16W400Text(
                  color: blackPrimary
                ),
                onTap: () async {
                  File? image = await _imageFromGallery();
                  goBack();
                  onPressed(image);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Constant.cameraText.to16W400Text(
                  color: blackPrimary
                ),
                onTap: () async {
                  File? image = await _imageFromCamera();
                  goBack();
                  onPressed(image);
                },
              ),
            ],
          ));
        });
  }

  static Future<File?> _imageFromCamera() async {
    File? image;
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 1000,
        maxWidth: 1000,
        imageQuality: 50);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      // Check the file size in bytes
      int imageSize = await image.length();

      // Convert bytes to MB
      double imageSizeInMB = imageSize / (1024 * 1024);
      if (imageSizeInMB > 1) {
        image = null;
        showToast( Constant.imageSizeMustBeLessThen1MB);
      }
      debugPrint('$image');
    } else {
      image = null;
      debugPrint('No image selected.');
    }
    return image;
  }

  static Future<File?> _imageFromGallery() async {
    File? image;
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1000,
      maxWidth: 1000,
      imageQuality: 50,
      requestFullMetadata: false,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      // Check the file size in bytes
      int imageSize = await image.length();

      // Convert bytes to MB
      double imageSizeInMB = imageSize / (1024 * 1024);
      if (imageSizeInMB > 1) {
        image = null;
        showToast(Constant.imageSizeMustBeLessThen1MB);
      }
      debugPrint('$image');
    } else {
      image = null;
      debugPrint('No image selected.');
    }
    return image;
  }

  // Edit Image
  static Future<File?> cropImage(File image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: Constant.setImage,
          toolbarColor:whitePrimary,
          backgroundColor: greenPrimary,
          statusBarColor: blackPrimary.withValues(alpha: 0.5),
          cropFrameColor: blackPrimary,
          cropGridColor:blackPrimary,
          toolbarWidgetColor:blackPrimary,
          activeControlsWidgetColor: greenPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio16x9
          ],
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: Constant.setImage,
          cancelButtonTitle: Constant.cancelText,
          doneButtonTitle: Constant.doneText,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio16x9
          ],
          minimumAspectRatio: 1.0,
          aspectRatioLockEnabled: false,
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }
}

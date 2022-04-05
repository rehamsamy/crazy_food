import 'dart:io';
import 'package:crazy_food/data/storage/local_storage.dart';
import 'package:crazy_food/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

showAppImageDialog({
  required BuildContext context,
  required Function(File image) onFilePicked,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => ImagePickerDialog(
      onFilePicked: onFilePicked,
    ),
  );
}

class ImagePickerDialog extends StatelessWidget {
  final Function(File image) onFilePicked;

  const ImagePickerDialog({
    Key? key,
    required this.onFilePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAr = LocalStorage.isAr;
    return CupertinoActionSheet(
      title: Text(
        isAr ? 'التقاط الصورة عبر' : 'Select photo by',
        style: Get.theme.textTheme.subtitle1!,
      ),
      cancelButton: CupertinoButton(
        child: Text(
          isAr ? "اغلاق" : 'Close',
          style: Get.theme.textTheme.bodyText1!.copyWith(
            color: kPrimaryColor,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        CupertinoButton(
            child: Row(
              children: <Widget>[
                const Icon(
                  CupertinoIcons.photo_camera_solid,
                  color: kPrimaryColor,
                ),
                const SizedBox(width: 20),
                Text(
                  isAr ? "الكاميرا" : 'Camera',
                  style: Get.theme.textTheme.bodyText1!,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.pop(context);
              File? imageFile = await _pickImage(gallery: false);
              if (imageFile != null) {
                onFilePicked(imageFile);
              }
            }),
        CupertinoButton(
            child: Row(
              children: <Widget>[
                const Icon(Icons.insert_photo, color: kPrimaryColor),
                const SizedBox(width: 20),
                Text(
                  isAr ? "الاستوديو" : 'Gallery',
                  style: Get.theme.textTheme.bodyText1!,
                ),
              ],
            ),
            onPressed: () async {
              Navigator.pop(context);
              File? imageFile = await _pickImage();
              if (imageFile != null) {
                onFilePicked(imageFile);
              }
            }),
      ],
    );
  }

  Future<File?> _pickImage({bool gallery = true}) async {
    XFile? media;
    if (gallery) {
      media = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      media = await ImagePicker().pickImage(source: ImageSource.camera);
    }

    if (media != null) {
      return File(media.path);
    } else {
      return null;
    }
  }
}

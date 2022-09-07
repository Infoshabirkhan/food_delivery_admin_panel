import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BrandStatic {
  static var imageUrl;
  static TextEditingController brandNameController = TextEditingController();
  static TextEditingController brandDescriptionController =
      TextEditingController();

  static clearAllFields() {
    brandNameController.clear();
    brandDescriptionController.clear();
    imageUrl = null;
  }

  static bool validate() {
    if (brandNameController.text.isEmpty) {
      showToastMessage(msg: 'Name is required');
      return false;
    } else if (brandDescriptionController.text.isEmpty) {
      showToastMessage(msg: 'Description is required');
      return false;
    } else if (imageUrl == null) {
      showToastMessage(msg: 'Image is required');
      return false;
    } else {
      return true;
    }
  }

  static showToastMessage({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      timeInSecForIosWeb: 3,
      webShowClose: true,
      //webBgColor: "linear-gradient(to right, #fdd775, #3f4953)",
      gravity: ToastGravity.BOTTOM_RIGHT,
    );
  }
}

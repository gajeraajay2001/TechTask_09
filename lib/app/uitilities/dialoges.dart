import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_exam_09/app/constant/color_constant.dart';

getDialog({String title = "Error", String desc = "Some Thing went wrong...."}) {
  return Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      content: Text(desc),
      buttonColor: appTheme.primaryTheme,
      textConfirm: "Ok",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      });
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color_constant.dart';
import '../constant/sizeConstant.dart';

TextFormField getTextField({
  String? hintText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  double? borderRadius,
  Widget? suffixIcon,
  double? size = 52,
  Widget? suffix,
  int maxLine = 1,
  bool textVisible = false,
  Color? fillColor,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: textVisible,
    textInputAction: TextInputAction.next,
    maxLines: maxLine,
    keyboardType: TextInputType.name,
    cursorColor: appTheme.primaryTheme,
    decoration: InputDecoration(
      fillColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size10! : borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size10! : borderRadius),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(
            (borderRadius == null) ? MySize.size10! : borderRadius),
      ),
      contentPadding: EdgeInsets.only(
        left: MySize.size20!,
        right: MySize.size10!,
        bottom: size! / 2, // HERE THE IMPORTANT PART
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: MySize.size14!, color: Color(0xff8692A6)),
    ),
  );
}

TextFormField getTextFormField(
    {required controller,
    FormFieldValidator<String>? validation,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    Function? ontap,
    List<TextInputFormatter>? formator,
    bool isReadOnly = false,
    bool enable = true,
    double? borderRadius,
    String? hintText,
    int? maxLine = 1}) {
  return TextFormField(
    controller: controller,
    cursorColor: appTheme.primaryTheme,
    readOnly: isReadOnly,
    enabled: enable,
    inputFormatters: formator,
    validator: validation,
    keyboardType: textInputType,
    maxLines: maxLine,
    textInputAction: textInputAction,
    decoration: InputDecoration(
        hintText: hintText,
        focusColor: appTheme.primaryTheme,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.primaryTheme),
          borderRadius: BorderRadius.circular(
              (borderRadius == null) ? MySize.size10! : borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              (borderRadius == null) ? MySize.size10! : borderRadius),
          borderSide: BorderSide(color: appTheme.primaryTheme),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.primaryTheme),
          borderRadius: BorderRadius.circular(
              (borderRadius == null) ? MySize.size10! : borderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appTheme.primaryTheme),
          borderRadius: BorderRadius.circular(
              (borderRadius == null) ? MySize.size10! : borderRadius),
        ),
        errorStyle: TextStyle(color: Colors.red),
        hintStyle: TextStyle(
          color: appTheme.textGrayColor,
        )),
  );
}

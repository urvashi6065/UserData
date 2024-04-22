import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControllerClass extends GetxController {
  bool isTheme = false;

  set isDarkTheme(value) {
    isTheme = value;
    (isTheme == true)
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
    update();
  }

  get isDarkTheme => isTheme;
}

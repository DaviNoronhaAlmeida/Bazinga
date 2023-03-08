import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors extends GetxController {
  Color textBtnColor = const Color.fromRGBO(255, 255, 255, 1);
  Color redColor = const Color.fromRGBO(228, 64, 64, 1);

  static const darkBarColor = Color.fromRGBO(25, 14, 79, 1);
  static const darkBackgroundColor = Color.fromRGBO(3, 1, 44, 1);
  static const darkBgPostsColor = Color.fromRGBO(26, 32, 62, 1);
  static const darkTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const darkDescriptionColor = Color.fromRGBO(255, 255, 255, 0.6);

  static const lightBarColor = Color.fromRGBO(54, 54, 54, 1);
  static const lightBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
  static const lightBgPostsColor = Color.fromRGBO(225, 225, 225, 1);
  static const lightTextColor = Color.fromARGB(0, 0, 0, 1);
  static const lightDescriptionColor = Color.fromRGBO(0, 0, 0, 0.6);

  dynamic barColor = darkBarColor;
  dynamic backgroundColor = darkBackgroundColor;
  dynamic bgPostsColor = darkBgPostsColor;
  dynamic textColor = darkTextColor;
  dynamic descriptionColor = darkDescriptionColor;

  void change() {
    /* backgroundColor = const Color.fromRGBO(245, 245, 245, 1);
    update(); */
  }
}

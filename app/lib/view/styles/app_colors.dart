import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors extends GetxController {
  Color bar = const Color.fromRGBO(25, 14, 79, 1);
  Color background = const Color.fromRGBO(3, 1, 44, 1);
  Color bgPosts = const Color.fromRGBO(26, 32, 62, 1);
  Color text = const Color.fromRGBO(255, 255, 255, 1);
  Color description = const Color.fromRGBO(255, 255, 255, 0.6);
  Color textBtn = const Color.fromRGBO(255, 255, 255, 1);
  Color red = const Color.fromRGBO(228, 64, 64, 1);

  void change() {
    background = const Color.fromRGBO(245, 245, 245, 1);
    update();
  }
}

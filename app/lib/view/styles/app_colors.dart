import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors extends GetxController {
  final textBtnColor = const Color.fromRGBO(255, 255, 255, 1).obs;
  final redColor = const Color.fromRGBO(228, 64, 64, 1).obs;
  var isDarkMode = true.obs;

  static const darkBarColor = Color.fromRGBO(25, 14, 79, 1);
  static const darkBackgroundColor = Color.fromRGBO(3, 1, 44, 1);
  static const darkBgPostsColor = Color.fromRGBO(26, 32, 62, 1);
  static const darkTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const darkDescriptionColor = Color.fromRGBO(255, 255, 255, 0.6);
  static const darkDivider = Color.fromRGBO(26, 32, 62, 1);
  static const darkSettingsDescription = 'Tema Escuro';

  static const lightBarColor = Color.fromRGBO(54, 54, 54, 1);
  static const lightBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
  static const lightBgPostsColor = Color.fromRGBO(225, 225, 225, 1);
  static const lightTextColor = Color.fromRGBO(8, 8, 8, 1);
  static const lightDescriptionColor = Color.fromRGBO(0, 0, 0, 0.6);
  static const lightDivider = Color.fromRGBO(86, 86, 86, 1);
  static const lightSettingsDescription = 'Tema Claro';

  final barColor = darkBarColor.obs;
  final backgroundColor = darkBackgroundColor.obs;
  final bgPostsColor = darkBgPostsColor.obs;
  final textColor = darkTextColor.obs;
  final descriptionColor = darkDescriptionColor.obs;
  final dividerColor = darkDivider.obs;
  final settingsDescription = darkSettingsDescription.obs;

  void updateColors() {
    isDarkMode.value = !isDarkMode.value;
    if (isDarkMode.value) {
      barColor.value = lightBarColor;
      backgroundColor.value = lightBackgroundColor;
      bgPostsColor.value = lightBgPostsColor;
      textColor.value = lightTextColor;
      descriptionColor.value = lightDescriptionColor;
      dividerColor.value = lightDivider;
      settingsDescription.value = lightSettingsDescription;
    } else {
      barColor.value = darkBarColor;
      backgroundColor.value = darkBackgroundColor;
      bgPostsColor.value = darkBgPostsColor;
      textColor.value = darkTextColor;
      descriptionColor.value = darkDescriptionColor;
      dividerColor.value = darkDivider;
      settingsDescription.value = darkSettingsDescription;
    }
  }
}

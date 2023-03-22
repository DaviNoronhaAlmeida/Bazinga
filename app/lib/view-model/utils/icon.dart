import 'package:get/get.dart';

class IconController extends GetxController {
  var selectedIcon = ''.obs; // the currently selected icon

  void selectIcon(String icon) {
    selectedIcon.value = icon;
  }
}

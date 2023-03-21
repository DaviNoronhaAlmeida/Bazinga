import 'package:get/get.dart';

class GroupId extends GetxController {
  dynamic _groupId = '';

  dynamic get groupId => _groupId;

  void setgroup(String group) {
    _groupId = group;
    update();
  }
}

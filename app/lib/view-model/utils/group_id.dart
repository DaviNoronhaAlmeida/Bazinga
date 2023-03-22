import 'package:get/get.dart';

class GroupId extends GetxController {
  dynamic _groupId = '';
  String _groupName = '';

  dynamic get groupId => _groupId;
  dynamic get groupName => _groupName;

  void setgroup(String group) {
    _groupId = group;
    update();
  }

  void setName(String name) {
    _groupName = name;
  }
}

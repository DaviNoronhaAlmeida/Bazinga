import 'package:get/get.dart';

class GroupId extends GetxController {
  dynamic _groupId = '';
  String _groupName = '';
  dynamic _data = [];

  dynamic get groupId => _groupId;
  dynamic get groupName => _groupName;
  dynamic get data => _data;

  void setGroup(String group) {
    _groupId = group;
    update();
  }

  void setName(String name) {
    _groupName = name;
  }

  void setData(var arr) {
    _data = arr;
    update();
  }
}

import 'package:get/get.dart';

class GroupId extends GetxController {
  dynamic _groupId = '';
  dynamic _data = [];

  dynamic get groupId => _groupId;
  dynamic get data => _data;

  void setGroup(String group) {
    _groupId = group;
    update();
  }

  void setData(var arr) {
    _data = arr;
    update();
  }
}

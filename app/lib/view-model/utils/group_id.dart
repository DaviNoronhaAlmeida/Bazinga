import 'package:get/get.dart';

class GroupId extends GetxController {
  dynamic _groupId = '';
  String _groupName = '';
  dynamic _data = [];
  List<dynamic> _members = [];

  dynamic get groupId => _groupId;
  dynamic get groupName => _groupName;
  dynamic get data => _data;
  dynamic get members => _members;

  void setGroup(String group) {
    _groupId = group;
    update();
  }

  void setName(String name) {
    _groupName = name;
    update();
  }

  void setData(var arr) {
    _data = arr;
    update();
  }

  void setMembers(List<dynamic> members) {
    _members = members;
    update();
  }
}

import 'package:get/get.dart';

class Info extends GetxController {
  dynamic _id = '';
  dynamic _name = '';

  dynamic get id => _id;
  dynamic get name => _name;

  void setName(String name) {
    _name = name;
    update();
  }

  void setID(String id) {
    _id = id;
  }
}

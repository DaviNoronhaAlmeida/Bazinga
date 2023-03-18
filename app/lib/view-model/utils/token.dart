import 'package:get/get.dart';

class Token extends GetxController {
  dynamic _token = '';

  dynamic get token => _token;

  void setToken(String token) {
    _token = token;
    update();
  }
}

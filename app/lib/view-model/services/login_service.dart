import 'package:app/model/authentication/login_req.dart';
import 'package:app/model/users_functions/get_info_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

void login(String email, String password, String? token) async {
  if (emailValidate(email) && passwordValidate(password)) {
    Map<String, dynamic> data = await loginReq(email, password, token);
    Map<String, dynamic> info = await infoReq();

    if (data['status'] == 200 && info['status'] == 200) {
      Get.toNamed('/feed');
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

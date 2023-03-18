import 'package:app/model/authentication/register_req.dart';
import 'package:app/view/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import '../../view/widgets/custom_snackbar.dart';
import '../validators/email_validator.dart';
import '../validators/nickname_validator.dart';
import '../validators/password_validator.dart';

void register(
    String name, String email, String password, BuildContext context) async {
  if (nickValidate(name) &&
      emailValidate(email) &&
      passwordValidate(password)) {
    Map<String, dynamic> data = await registerReq(name, email, password);

    if (data['status'] == 200) {
      // ignore: use_build_context_synchronously
      showCustomDialog(context, 'Cadastrado com sucesso!', 'ENTRAR');
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

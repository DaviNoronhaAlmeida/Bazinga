import 'package:app/model/users_functions/delete_user_req.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../view/widgets/custom_dialog.dart';
import '../../view/widgets/custom_snackbar.dart';

void delete(BuildContext context) async {
  Map<String, dynamic> data = await deleteUserReq();

  if (data['status'] == 200) {
    // ignore: use_build_context_synchronously
    showCustomDialog(
      context,
      'Conta deletada!',
      'SAIR',
      () => Get.toNamed('/'),
    );
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

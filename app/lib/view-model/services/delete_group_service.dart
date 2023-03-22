import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/group_functions/delete_group_req.dart';
import '../../view/widgets/custom_dialog.dart';
import '../../view/widgets/custom_snackbar.dart';

void deleteGroup(BuildContext context, String id) async {
  Map<String, dynamic> data = await deleteGroupReq(id);

  if (data['status'] == 200) {
    // ignore: use_build_context_synchronously
    showCustomDialog(
      context,
      'Grupo deletado!',
      'SAIR',
      () => Get.toNamed('/groupHome'),
    );
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

import 'package:app/model/group_functions/add_member_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void changeMembers(String name, List<dynamic> members, String id) async {
  Map<String, dynamic> data = await changeMembersReq(id, name, members);

  if (data['status'] == 200) {
    showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
        title: Text('Atualizado!'),
        content: Text('Membros adicionados com sucesso!'),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed('/editGroup');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

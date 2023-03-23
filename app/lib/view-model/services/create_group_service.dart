import 'package:app/view-model/controllers/groups_controller.dart';
import 'package:app/model/group_functions/create_group_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void createGroup(String name, List<String> members) async {
  Map<String, dynamic> data = await createGroupReq(name, members);

  if (data['status'] == 200) {
    showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
        title: Text('Grupo criado!'),
        content: Text('O seu grupo foi criado com sucesso!'),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    // ignore: no_leading_underscores_for_local_identifiers
    final GroupsController _groupController = Get.put(GroupsController());
    _groupController.loadFeed();
    Get.toNamed('/groupHome');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

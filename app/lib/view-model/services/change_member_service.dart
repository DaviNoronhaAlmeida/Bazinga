import 'package:app/model/group_functions/add_member_req.dart';
import 'package:app/view-model/controllers/groups_controller.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/groups_controller.dart';

void changeMembers(String name, List<dynamic> members, String id) async {
  final GroupsController groupController = Get.put(GroupsController());
  Map<String, dynamic> data = await changeMembersReq(id, name, members);

  if (data['status'] == 200) {
    final GroupsController groupController = Get.put(GroupsController());
    groupController.loadFeed();
    showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
        title: Text('Atualizado!'),
        content: Text('Grupo atualizado com sucesso!'),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    groupController.loadFeed();
    Get.toNamed('/editGroup');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

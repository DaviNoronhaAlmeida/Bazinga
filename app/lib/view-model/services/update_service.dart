import '../../model/users_functions/update_user_req.dart';
import 'package:app/view-model/controllers/feed_controller.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';

void update(String? token, String req, String param, String newName) async {
  Map<String, dynamic> data = await newUpdateReq(token, req);

  if (data['status'] == 200) {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: const Text('Alteração Concluída'),
        content: Text('$param foi alterado(a) com sucesso!'),
      ),
    );

    Get.find<Info>().setName(newName);

    // ignore: no_leading_underscores_for_local_identifiers
    final FeedController _feedController = Get.put(FeedController());
    _feedController.loadFeed();
    /* await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/settings'); */
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

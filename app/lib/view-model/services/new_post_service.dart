import 'package:app/model/feed_functions/new_post_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void newPost(String text, String? token, String imagePath) async {
  Map<String, dynamic> data = await newPostReq(text, token, imagePath);

  if (data['status'] == 200) {
    showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
        title: Text('Postagem feita'),
        content: Text('Sua postagem foi publicada com sucesso!'),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/feed');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

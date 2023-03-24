import 'package:app/model/feed_functions/new_comment_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void newComment(String text, String? token, String postId) async {
  Map<String, dynamic> data = await newCommentReq(text, token, postId);

  if (data['status'] == 200) {
    /* showDialog(
      context: Get.context!,
      builder: (_) => const AlertDialog(
        title: Text('Comentário enviado'),
        content: Text('Seu comentário foi publicado com sucesso!'),
      ),
    ); */
    await Future.delayed(const Duration(seconds: 2));
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

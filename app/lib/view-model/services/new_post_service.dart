import 'package:app/model/feed_functions/new_post_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

void newPost(String text, String? token) async {
  Map<String, dynamic> data = await newPostReq(text, token);

  if (data['status'] == 200) {
    Get.toNamed('/feed');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

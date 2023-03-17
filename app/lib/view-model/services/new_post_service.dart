import 'package:app/model/feed_functions/new_post.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';
import '../validators/email_validator.dart';
import '../validators/password_validator.dart';

void new_post(String text, String? token) async {
  Map<String, dynamic> data = await newPost(text, token);

  if (data['status'] == 200) {
    Get.toNamed('/feed');
  } else {
    CustomSnackBar.show(data['content']['message']);
  }
}

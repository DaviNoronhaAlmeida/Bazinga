import 'package:app/model/group_functions/search_users_id._req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class SearchUsersId extends GetxController {
  List<String> users = <String>[];

  search(String search) async {
    Map<String, dynamic> data = await searchUserIdReq(search);

    if (data['status'] == 200) {
      users.add(data['content'][0]['_id']);
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
    update();
  }
}

import 'package:get/get.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:app/model/feed_functions/profile_req.dart';
// ignore: depend_on_referenced_packages
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileController extends GetxController {
  final profileData = <dynamic>[].obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() async {
    Map<String, dynamic> data = await profileReq();

    if (data['status'] == 200) {
      profileData.value = data['content'];
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

import 'package:get/get.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
// ignore: depend_on_referenced_packages
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../model/chat_functions/group_req.dart';

class GroupsController extends GetxController {
  final groupData = <dynamic>[].obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final commentUser = ''.obs;
  final commentContent = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }

  void loadFeed() async {
    Map<String, dynamic> data = await groupReq();

    if (data['status'] == 200) {
      groupData.value = data['content'];
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

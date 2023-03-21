import 'package:get/get.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:app/model/feed_functions/feed_req.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedController extends GetxController {
  final feedData = <dynamic>[].obs;
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
    Map<String, dynamic> data = await feedReq();

    if (data['status'] == 200) {
      feedData.value = data['content'];
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

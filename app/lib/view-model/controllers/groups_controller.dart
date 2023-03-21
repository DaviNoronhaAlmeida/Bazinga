import 'package:app/model/group_functions/list_groups_req.dart';
import 'package:app/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class ListGroupsController extends GetxController {
  final groupsData = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadGroups();
  }

  void loadGroups() async {
    Map<String, dynamic> data = await listGroupsReq();
    if (data['status'] == 200) {
      groupsData.value = data['content'];
    } else {
      CustomSnackBar.show(data['content']['message']);
    }
  }
}

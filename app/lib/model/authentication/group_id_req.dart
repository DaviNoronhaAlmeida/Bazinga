import 'package:app/view-model/utils/group_id.dart';
import 'package:get/get.dart';

Future<Map<String, dynamic>> groupIdReq(String id) async {
  Get.find<GroupId>().setGroup(id);

  return <String, dynamic>{
    'id': id,
  };
}

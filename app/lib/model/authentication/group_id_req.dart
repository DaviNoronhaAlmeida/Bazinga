import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:get/get.dart';
import '../../view-model/utils/token.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> groupIdReq(String id) async {
  Get.find<GroupId>().setgroup(id);

  return <String, dynamic>{
    'id': id,
  };
}

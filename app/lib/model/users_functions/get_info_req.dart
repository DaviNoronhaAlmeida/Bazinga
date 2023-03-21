import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:app/view-model/utils/user_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';

Future<Map<String, dynamic>> infoReq() async {
  final token = Get.find<Token>().token;
  final response = await http.get(
    Uri.parse('${Base().url}/api/user'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
  );
  final jsonResponse = jsonDecode(response.body);

  if (response.statusCode == 200 && jsonResponse != null) {
    Get.put<Info>(Info()).setID(jsonResponse['_id']);
    Get.find<Info>().setName(jsonResponse['nick']);
  }

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';
import '../../config/base.dart';

Future<Map<String, dynamic>> listGroupsReq() async {
  final token = Get.find<Token>().token;
  final response = await http.get(
    Uri.parse('${Base().url}/api/groups'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

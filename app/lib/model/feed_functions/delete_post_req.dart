import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';

Future<Map<String, dynamic>> deletePostReq(String id) async {
  final token = Get.find<Token>().token;
  final response = await http.delete(
    Uri.parse('${Base().url}/api/posts/$id'),
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

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';

Future<Map<String, dynamic>> feedReq() async {
  final token = Get.find<Token>().token;
  final response = await http.get(
    Uri.parse('http://10.0.2.2:4000/api/posts'),
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

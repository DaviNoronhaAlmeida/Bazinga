import 'dart:convert';
import 'package:app/view-model/utils/user_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';
import '../../config/base.dart';

Future<Map<String, dynamic>> deleteUserReq() async {
  final token = Get.find<Token>().token;
  final userID = Get.find<Info>().id;
  final response = await http.delete(
    Uri.parse('${Base().url}/api/users/$userID'),
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

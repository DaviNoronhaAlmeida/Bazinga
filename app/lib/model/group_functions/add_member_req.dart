import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app/view-model/utils/token.dart';
import '../../config/base.dart';

Future<Map<String, dynamic>> changeMembersReq(
    String id, String name, List<dynamic> members) async {
  final token = Get.find<Token>().token;
  final response = await http.put(
    Uri.parse('${Base().url}/api/group/$id'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode({"name": name, "members": members}),
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> newPostReq(
    String text, String? token, String imagePath) async {
  final response = await http.post(
    Uri.parse('${Base().url}/api/posts'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode({"id_creator": "", "content": text, "img": imagePath}),
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> newCommentReq(
    String text, String? token, String postId) async {
  final response = await http.post(
    Uri.parse('${Base().url}/api/posts/$postId/comment'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode({"content": text}),
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

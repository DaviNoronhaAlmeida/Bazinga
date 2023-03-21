import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> newCommentReq(
    String text, String? token, String postId) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:4000/api/posts/$postId/comment'),
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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> newPost(String text, String? token) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:4000/api/posts'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode({"id_creator": "", "content": text}),
  );
  final jsonResponse = jsonDecode(response.body);
  print(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

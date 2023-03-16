import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginReq(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:4000/api/users/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({"email": email, "password": password}),
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> registerReq(
    String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('${Base().url}/api/users/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
        {"name": "nome", "nick": name, "email": email, "password": password}),
  );

  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

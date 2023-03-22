import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/base.dart';

Future<Map<String, dynamic>> newUpdateReq(String? token, String req) async {
  final response = await http.patch(
    Uri.parse('${Base().url}/api/user'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: req,
  );
  final jsonResponse = jsonDecode(response.body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

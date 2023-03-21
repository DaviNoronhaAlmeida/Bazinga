import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> newUpdateReq(String? token, String req) async {
  print('object');
  final response = await http.patch(
    Uri.parse('http://10.0.2.2:4000/api/user'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: req,
  );
  final jsonResponse = jsonDecode(response.body);
  print(jsonResponse);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

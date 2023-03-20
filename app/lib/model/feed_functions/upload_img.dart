import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../view-model/utils/token.dart';

Future<Map<String, dynamic>> uploadImg(String imagePath) async {
  final tokenAuth = Get.find<Token>().token;

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://10.0.2.2:4000/api/upload'),
  );
  request.headers['Content-Type'] = 'multipart/form-data';
  request.headers['Authorization'] = 'Bearer $tokenAuth';
  request.files
      .add(await http.MultipartFile.fromPath('filetoupload', imagePath));

  var response = await request.send();
  final body = await response.stream.bytesToString();
  final jsonResponse = jsonDecode(body);

  return <String, dynamic>{
    'status': response.statusCode,
    'content': jsonResponse,
  };
}

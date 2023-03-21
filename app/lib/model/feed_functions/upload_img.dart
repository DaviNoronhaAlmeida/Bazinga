import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../view-model/utils/token.dart';

Future<Map<String, dynamic>> uploadImg(String imagePath) async {
  final tokenAuth = Get.find<Token>().token;

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('${Base().url}/api/upload'),
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

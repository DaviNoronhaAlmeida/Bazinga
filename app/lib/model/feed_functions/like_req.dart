import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../view-model/utils/token.dart';
import 'package:app/model/feed_functions/unlike_req.dart';

Future<Map<String, dynamic>> likePostReq(String postId) async {
  final tokenAuth = Get.find<Token>().token;
  final response = await http.post(
    Uri.parse('${Base().url}/api/posts/$postId/like'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenAuth',
    },
  );
  final jsonResponse = jsonDecode(response.body);

  if (jsonResponse['message'] == 'Já existe seu like.') {
    final unlikeResponse = await unlikePostReq(postId);

    return unlikeResponse;
  } else {
    return <String, dynamic>{
      'status': response.statusCode,
      'content': '+1',
    };
  }
}

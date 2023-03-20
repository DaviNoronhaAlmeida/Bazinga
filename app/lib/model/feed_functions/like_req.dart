import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../view-model/utils/user_info.dart';
import 'package:get/get.dart';
import '../../view-model/utils/token.dart';
import 'package:flutter/material.dart';
import 'package:app/model/feed_functions/unlike_req.dart';

Future<Map<String, dynamic>> likePostReq(String postId) async {
  final tokenAuth = Get.find<Token>().token;
  final response = await http.post(
    Uri.parse('http://10.0.2.2:4000/api/posts/$postId/like'),
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

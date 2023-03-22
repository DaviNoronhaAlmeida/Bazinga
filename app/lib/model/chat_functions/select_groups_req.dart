import 'dart:convert';
import 'package:app/config/base.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:app/view-model/utils/token.dart';

Future<Map<String, dynamic>> selectGroupReq(String id) async {
  var dados = [];
  final token = Get.find<Token>().token;
  IO.Socket socket = IO.io('${Base().url}', <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
    'extraHeaders': {
      'Authorization': 'Bearer ${token}',
    }
  });
  Get.put(GroupId()).setGroup(id);
  socket.emitWithAck('select_group', {
    'group_id': "$id",
    'token': '${token}'
  }, ack: (data) {
    dados = data;
    Get.put(GroupId()).setData(data);
  });
  socket.connect();

  return <String, dynamic>{
    'content': dados,
  };
}

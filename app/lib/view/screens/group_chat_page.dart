import 'package:app/config/base.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:app/view-model/utils/token.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../styles/app_colors.dart';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final AppColors _appColors = Get.find();
  String text = "";
  late var dados;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    Map<String, String> headers = {
      'Authorization': 'Bearer token',
    };
    socket = IO.io('${Base().url}', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': headers,
    });
    socket.onConnect((_) {
      print('connected');
      final token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDE3ZDUxYTdmODg4NGE2MDc1NzFiOGIiLCJuYW1lIjoiTFVDQVMgU0lMVkEiLCJuaWNrIjoibHVjYXMiLCJlbWFpbCI6Imx1Y2FzQGVtYWlsLmNvbSIsImlhdCI6MTY3OTQ2MTU4MCwiZXhwIjoxNjc5NDY1MTgwfQ.RklPZkxe40PZm7bB2-XHXztVLvdosflvYdGcdhkf59Q";
      Map json = {'group_id': "6419ee0a0e85f6f15e3478ea", 'token': '$token'};
      socket.emitWithAck('select_group', {
        'group_id': "6419ee0a0e85f6f15e3478ea",
        'token': '$token'
      }, ack: (data) {
        setState(() {
          dados = data;
        });
        print('$data');
      });
      socket.connect();
    });
  }

  void reset() {
    print('Hello');
    final token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDE3ZDUxYTdmODg4NGE2MDc1NzFiOGIiLCJuYW1lIjoiTFVDQVMgU0lMVkEiLCJuaWNrIjoibHVjYXMiLCJlbWFpbCI6Imx1Y2FzQGVtYWlsLmNvbSIsImlhdCI6MTY3OTQ2MTU4MCwiZXhwIjoxNjc5NDY1MTgwfQ.RklPZkxe40PZm7bB2-XHXztVLvdosflvYdGcdhkf59Q";
    Map json = {'group_id': "6419ee0a0e85f6f15e3478ea", 'token': '$token'};
    socket.emitWithAck('select_group', {
      'group_id': "6419ee0a0e85f6f15e3478ea",
      'token': '$token'
    }, ack: (data) {
      setState(() {
        dados = data;
      });
      print('$data');
    });
  }

  @override
  Widget build(BuildContext context) {
    reset();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: _appColors.backgroundColor.value,
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            //Página principal
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var msg in dados)
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomChat(
                                username: '${msg['username']}',
                                postText: '${msg['text']}',
                                leftMarging: 0,
                                rightMarging: 40,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 280,
                            alignment: Alignment.bottomLeft,
                            child: TextField(
                              onChanged: (value) => {
                                setState(() {
                                  text = value;
                                })
                              },
                              maxLines: null,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: _appColors.redColor.value,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: _appColors.redColor.value,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: _appColors.textColor.value,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            alignment: Alignment.bottomLeft,
                            child: FloatingActionButton(
                              backgroundColor: _appColors.redColor.value,
                              onPressed: () {
                                final token =
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDE3ZDUxYTdmODg4NGE2MDc1NzFiOGIiLCJuYW1lIjoiTFVDQVMgU0lMVkEiLCJuaWNrIjoibHVjYXMiLCJlbWFpbCI6Imx1Y2FzQGVtYWlsLmNvbSIsImlhdCI6MTY3OTQ2MTU4MCwiZXhwIjoxNjc5NDY1MTgwfQ.RklPZkxe40PZm7bB2-XHXztVLvdosflvYdGcdhkf59Q";
                                Map json = {
                                  'group_id': "6419ee0a0e85f6f15e3478ea",
                                  'token': '$token'
                                };
                                socket.emitWithAck('message', {
                                  'group_id': "6419ee0a0e85f6f15e3478ea",
                                  'token': '$token',
                                  'message': "${text}"
                                }, ack: (data) {
                                  print('$token');
                                }, binary: true);
                              },
                              child: const Icon(Icons.arrow_forward, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Botão no topo para edição

            Positioned(
              top: 10,
              right: 16,
              child: SizedBox(
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: _appColors.redColor.value,
                  onPressed: () {
                    Get.toNamed('/editGroup');
                  },
                  child: const Icon(Icons.edit, size: 30),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }

  @override
  void dispose() {
    print("Bye");
    // Disconnect the socket when the page is disposed
    socket.disconnect();
    super.dispose();
  }
}

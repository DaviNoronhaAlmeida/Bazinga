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
  final Token _token = Get.find();
  final GroupId _idGroup = Get.find();
  TextEditingController inputController = TextEditingController();
  var dados = [];
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    socket = IO.io(Base().url, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': {
        'Authorization': 'Bearer ${_token.token}',
      }
    });
    socket.onConnect((_) {
      // _idGroup = Get.put(GroupId());
      socket.connect();
    });
    socket.emitWithAck('select_group', {
      'group_id': "${_idGroup.groupId}",
      'token': '${_token.token}'
    }, ack: (data) {
      setState(() {
        dados = data;
      });
      _idGroup.setData(data);
    });
    socket.on('message', (data) {
      setState(() {
        dados.add(data);
      });
    });
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: dados.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomChat(
                            username: '${dados[index]['username']}',
                            postText: '${dados[index]['text']}',
                            leftMarging: 0,
                            rightMarging: 40,
                          ),
                        );
                      },
                      // Column(
                      //   children: [
                      //     for (var msg in dados)
                      //       Container(
                      //         padding: const EdgeInsets.only(top: 10),
                      //         child: CustomChat(
                      //           username: '${msg['username']}',
                      //           postText: '${msg['text']}',
                      //           leftMarging: 0,
                      //           rightMarging: 40,
                      //         ),
                      //       ),
                      //     Container(
                      //       padding: const EdgeInsets.only(top: 10),
                      //       child: CustomChat(
                      //         username: '1111111111111',
                      //         postText: '111111111111',
                      //         leftMarging: 0,
                      //         rightMarging: 40,
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                              controller: inputController,
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
                                if (inputController.text.isNotEmpty) {
                                  socket.emitWithAck(
                                    'message',
                                    {
                                      'group_id': "${_idGroup.groupId}",
                                      'token': '${_token.token}',
                                      'message': inputController.text
                                    },
                                  );
                                  inputController.clear();
                                }
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
}

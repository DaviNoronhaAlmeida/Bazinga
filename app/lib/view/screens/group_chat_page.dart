import 'package:app/config/base.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:app/view-model/utils/token.dart';
import 'package:app/view/widgets/custom_group_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../view-model/utils/user_info.dart';
import '../styles/app_colors.dart';
import 'dart:async';

class GroupChatPage extends StatefulWidget {
  const GroupChatPage({super.key});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final AppColors _appColors = Get.find();
  final Token _token = Get.find();
  final GroupId _idGroup = Get.find();
  final myNick = Get.find<Info>().name;
  TextEditingController inputController = TextEditingController();
  late ScrollController scrollController;
  var dados = [];
  late IO.Socket socket;

  @override
  void initState() {
    scrollController = ScrollController();
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
    scrollController.dispose();
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String GroupName = _idGroup.groupName;
    Timer(
        Duration(milliseconds: 100),
        () =>
            scrollController.jumpTo(scrollController.position.maxScrollExtent));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _appColors.backgroundColor.value,
        appBar: CustomGroupAppBar(groupName: GroupName),
        body: Stack(
          children: [
            //Página principal
            Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 520,
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: dados.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: myNick == dados[index]['username']
                                ? CustomChat(
                                    username: '${dados[index]['username']}',
                                    postText: '${dados[index]['text']}',
                                    leftMarging: 60,
                                    rightMarging: 0,
                                  )
                                : CustomChat(
                                    username: '${dados[index]['username']}',
                                    postText: '${dados[index]['text']}',
                                    leftMarging: 0,
                                    rightMarging: 40,
                                  ),
                          );
                        }),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 70,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 280,
                              alignment: Alignment.center,
                              child: TextField(
                                controller: inputController,
                                maxLines: null,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
                                    scrollDown();
                                  }
                                },
                                child:
                                    const Icon(Icons.arrow_forward, size: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Botão no topo para edição
            ),
            Positioned(
              top: 10,
              right: 16,
              child: SizedBox(
                width: 40,
                child: FloatingActionButton(
                  heroTag: null,
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

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2), curve: Curves.easeOut);
  }
}

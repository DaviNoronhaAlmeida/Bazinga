import 'package:app/config/base.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  IO.Socket socket = IO.io('${Base().url}');
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
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomChat(
                              username: 'Usuário 1',
                              postText:
                                  'Primeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira MensagemPrimeira Mensagem',
                              leftMarging: 0,
                              rightMarging: 40,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomChat(
                              username: 'Usuário 2',
                              postText: 'Segunda Mensagem.',
                              leftMarging: 0,
                              rightMarging: 40,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomChat(
                              username: 'Usuário 3',
                              postText: 'Minha própria mensagem.',
                              leftMarging: 60,
                              rightMarging: 0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomChat(
                              username: 'Usuário 2',
                              postText: 'Segunda Mensagem.',
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
                                socket.onConnect((_) {
                                  print('connect');
                                  Map json = {
                                    'group_id': "6419ee0a0e85f6f15e3478ea",
                                    'message': text
                                  };
                                  socket.emit('message', json);
                                });
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

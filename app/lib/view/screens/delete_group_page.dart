import 'package:app/view-model/controllers/groups_controller.dart';
import 'package:app/view-model/services/delete_group_service.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/group_id.dart';
import '../styles/app_colors.dart';

class DeleteGroupPage extends StatelessWidget {
  DeleteGroupPage({super.key});
  final AppColors _appColors = Get.find();
  final GroupId groupInfo = Get.find();
  final GroupsController groups = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //Ícone e nome do grupo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                          text: groupInfo.groupName.length > 19
                              ? "${groupInfo.groupName.substring(0, 19)}..."
                              : groupInfo.groupName,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: _appColors.textColor.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Texto
                const Spacer(),
                Text(
                  'Tem certeza que deseja excluir o grupo?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: _appColors.textColor.value,
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(),
                Text(
                  'Todas as mensagens serão apagadas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: _appColors.descriptionColor.value,
                    fontSize: 35,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                //Botão de Salvar
                const Spacer(),
                const Spacer(),
                CustomBigButton(
                  tittleBtn: 'EXCLUIR',
                  customMargin: 0,
                  function: () {
                    deleteGroup(context, groupInfo.groupId);
                    groups.loadFeed();
                  },
                ),
              ],
            ),
          ),

          //Botão de voltar
          Positioned(
            top: 10,
            left: 16,
            child: SizedBox(
              width: 40,
              child: FloatingActionButton(
                backgroundColor: _appColors.redColor.value,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

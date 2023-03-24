import 'package:app/view-model/services/change_member_service.dart';
import 'package:app/view-model/validators/name_validator.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/group_id.dart';
import '../styles/app_colors.dart';

class EditGroupNamePage extends StatelessWidget {
  EditGroupNamePage({super.key});
  final AppColors _appColors = Get.find();
  final GroupId groupInfo = Get.find();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // recupera o foco atual e o remove
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _appColors.backgroundColor.value,
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Ícone e nome do grupo
                      /* const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 70,
                      ), */
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: groupInfo.groupName.length > 17
                                ? "${groupInfo.groupName.substring(0, 17)}..."
                                : groupInfo.groupName,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              color: _appColors.textColor.value,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Itens do Menu
                CustomInput(
                  inputTittle: 'Novo Nome do Grupo:',
                  controller: _nameController,
                  hide: false,
                ),
                const Spacer(),

                //Botão de salvar
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 70,
                    function: () {
                      if (nameValidate(_nameController.text)) {
                        changeMembers(_nameController.text, groupInfo.members,
                            groupInfo.groupId);
                      }
                    },
                  ),
                ),
              ],
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
      ),
    );
  }
}

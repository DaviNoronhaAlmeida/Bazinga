import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_add_member.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class EditGroupMemberPage extends StatelessWidget {
  EditGroupMemberPage({super.key});
  final AppColors _appColors = Get.find();
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
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Ícone e nome do grupo
                      const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Nome do Grupo',
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

                  //Search User
                  CustomInput(
                    inputTittle: 'Pesquisar Usuário:',
                    controller: _nameController,
                    hide: false,
                  ),

                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //Users Found
                          AddMember(
                            username: 'Usuário 1',
                            icon: 'Endereço do ícone',
                          ),
                          const SizedBox(height: 6),
                          AddMember(
                            username: 'Usuário 2',
                            icon: 'Endereço do ícone',
                          ),
                          const SizedBox(height: 6),
                          AddMember(
                            username: 'Usuário 3',
                            icon: 'Endereço do ícone',
                          ),
                          const SizedBox(height: 6),
                          AddMember(
                            username: 'Usuário 4',
                            icon: 'Endereço do ícone',
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Added list
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                        color: _appColors.dividerColor.value, thickness: 2),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(
                            text: TextSpan(
                              text: 'Usuários adicionados',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: _appColors.descriptionColor.value,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Botão de Salvar
                  const Spacer(),
                  CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 0,
                    function: () => Get.back(),
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
      ),
    );
  }
}

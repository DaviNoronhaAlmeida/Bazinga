import 'package:app/view-model/utils/user_info.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_settings_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final AppColors _appColors = Get.find();
  final userName = Get.find<Info>().name;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: _appColors.backgroundColor.value,
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                //Título
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
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
                            text: userName,
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

                //Menu
                CustomSettingsOption(
                  function: () {
                    /* Get.find<AppColors>().change(); */

                    Get.find<AppColors>().updateColors();
                    Get.toNamed('/settings');
                  },
                  tittle: 'Trocar Tema',
                  description: _appColors.settingsDescription.value,
                ),
                const Spacer(),
                CustomSettingsOption(
                  function: () => {Get.toNamed('/editNameEmail')},
                  tittle: 'Editar Nome',
                  description: 'Trocar Nome de Usuário',
                ),
                const Spacer(),
                CustomSettingsOption(
                  function: () => {Get.toNamed('/editProfileIcon')},
                  tittle: 'Editar Ícone',
                  description: 'Trocar Ícone do Perfil',
                ),
                const Spacer(),
                CustomSettingsOption(
                  function: () => {Get.toNamed('/editPassword')},
                  tittle: 'Nova Senha',
                  description: 'Trocar Senha da Conta',
                ),
                const Spacer(),
                CustomSettingsOption(
                  function: () => {Get.toNamed('/deleteProfile')},
                  tittle: 'Excluir Conta',
                  description: 'Excluir Conta de Forma Permanente',
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomNavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: _appColors.redColor.value,
          onPressed: () {
            Get.toNamed('/');
          },
          child: const Icon(Icons.logout, size: 30),
        ),
      ),
    );
  }
}

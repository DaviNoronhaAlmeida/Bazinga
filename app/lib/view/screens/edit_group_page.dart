import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_settings_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class EditGroupPage extends StatelessWidget {
  EditGroupPage({super.key});
  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor,
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
                            color: _appColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomSettingsOption(
                function: () => {Get.toNamed('/editGroupName')},
                tittle: 'Editar Nome',
                description: 'Trocar Nome do Grupo',
              ),
              const Spacer(),
              CustomSettingsOption(
                function: () => {Get.toNamed('/editGroupIcon')},
                tittle: 'Editar Ícone',
                description: 'Trocar Imagem do Grupo',
              ),
              const Spacer(),
              CustomSettingsOption(
                function: () => {Get.toNamed('/editGroupMember')},
                tittle: 'Editar Membros',
                description: 'Adicionar ou Remover Membros',
              ),
              const Spacer(),
              CustomSettingsOption(
                function: () => {Get.toNamed('/deleteGroup')},
                tittle: 'Excluir Grupo',
                description: 'Excluir Grupo de Forma Permanente',
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            top: 10,
            left: 16,
            child: Container(
              width: 40,
              child: FloatingActionButton(
                backgroundColor: _appColors.redColor,
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

import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_group_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class GroupHomePage extends StatelessWidget {
  GroupHomePage({super.key});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GroupInfo(
              groupName: 'Nome do Grupo',
              icon: 'Endereço do ícone',
              lastMessage: 'Última mensagem enviada',
            ),
            const SizedBox(height: 10),
            GroupInfo(
              groupName: 'Nome do Grupo',
              icon: 'Endereço do ícone',
              lastMessage: 'Última mensagem enviada',
            ),
            const SizedBox(height: 10),
            GroupInfo(
              groupName: 'Nome do Grupo',
              icon: 'Endereço do ícone',
              lastMessage: 'Última mensagem enviada',
            ),
            const SizedBox(height: 10),
            GroupInfo(
              groupName: 'Nome do Grupo',
              icon: 'Endereço do ícone',
              lastMessage: 'Última mensagem enviada',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appColors.redColor.value,
        onPressed: () {
          Get.toNamed('/newGroup');
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

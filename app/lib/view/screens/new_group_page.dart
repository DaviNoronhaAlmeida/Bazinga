import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_add_member.dart';
import 'package:app/view/widgets/custom_added_member.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class NewGroupPage extends StatelessWidget {
  NewGroupPage({super.key});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColors.backgroundColor,
      appBar: CustomAppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Search User
            CustomInput(inputTittle: 'Pesquisar Usuário:'),

            SizedBox(
              height: 285,
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
              child: Divider(color: _appColors.dividerColor, thickness: 2),
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
                          color: _appColors.descriptionColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          AddedMember(
                              username: 'Usuário 1', icon: 'Endereçodo ícone'),
                          const SizedBox(width: 10),
                          AddedMember(
                              username: 'Usuário 2', icon: 'Endereçodo ícone'),
                          const SizedBox(width: 10),
                          AddedMember(
                              username: 'Usuário 3', icon: 'Endereçodo ícone'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Next button
            CustomBigButton(
              tittleBtn: 'PRÓXIMO',
              customMargin: 15,
              function: () => Get.toNamed('/newGroupIcon'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

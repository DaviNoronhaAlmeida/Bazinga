import 'package:app/view-model/validators/equality_validator.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import '../../view-model/services/update_password_service.dart';
import '../../view-model/utils/token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';
import '../styles/app_colors.dart';
import 'dart:convert';

// ignore: must_be_immutable
class EditPasswordPage extends StatelessWidget {
  EditPasswordPage({super.key});
  final AppColors _appColors = Get.find();
  final userName = Get.find<Info>().name;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  dynamic sendToken = "";
  dynamic req = "";
  dynamic param = "";
  String reqString = "";

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

                //Itens do Menu
                CustomInput(
                  inputTittle: 'Senha Atual:',
                  controller: _passwordController,
                  hide: true,
                ),
                const SizedBox(height: 16),
                CustomInput(
                  inputTittle: 'Nova Senha:',
                  controller: _newPasswordController,
                  hide: true,
                ),
                const SizedBox(height: 16),
                CustomInput(
                  inputTittle: 'Confirmar Nova Senha:',
                  controller: _confirmPasswordController,
                  hide: true,
                ),

                //Botão de salvar
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 70,
                    function: () => {
                      if (equalityValidate(_newPasswordController.text,
                          _confirmPasswordController.text))
                        {
                          sendToken = Get.find<Token>().token,
                          req = {"password": _newPasswordController.text},
                          reqString = jsonEncode(req),
                          param = "Senha",
                          updatePassword(sendToken, reqString, param,
                              _newPasswordController.text),
                        },
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

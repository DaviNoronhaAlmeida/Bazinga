import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class EditPasswordPage extends StatelessWidget {
  EditPasswordPage({super.key});
  final AppColors _appColors = Get.find();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                            text: 'Nome do Usuário',
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

                //Itens do Menu
                CustomInput(
                  inputTittle: 'Senha Anterior:',
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                CustomInput(
                  inputTittle: 'Senha Atual:',
                  controller: _newPasswordController,
                ),
                const SizedBox(height: 16),
                CustomInput(
                  inputTittle: 'Repetir Senha Atual:',
                  controller: _confirmPasswordController,
                ),

                //Botão de salvar
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 70,
                    function: () => Get.back(),
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
      ),
    );
  }
}

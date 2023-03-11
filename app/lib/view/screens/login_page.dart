import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_settings_option.dart';
import 'package:app/view/widgets/custom_small_button.dart';
import 'package:app/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppColors>(
      init: AppColors(),
      builder: (_) {
        return Scaffold(
          backgroundColor: _.backgroundColor,
          appBar: CustomAppBar(),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: CustomInput(
                    inputTittle: 'Senha:',
                  ),
                ),
                CustomBigButton(
                  tittleBtn: 'SALVAR',
                  customMargin: 15,
                  function: () => print('object'),
                ),
                CustomSmallButton(
                  tittleBtn: 'LOGIN',
                  customMargin: 20,
                  function: () => print('object'),
                ),
                CustomTextButton(
                  tittle: 'CADASTRAR',
                  function: () => print('object'),
                ),
                CustomSettingsOption(
                  function: () => print('object'),
                  tittle: 'Excluir Conta',
                  description: 'Excluir conta de forma permanente',
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomNavBar(),
        );
      },
    );
  }
}

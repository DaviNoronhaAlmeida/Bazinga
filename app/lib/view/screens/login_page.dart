import 'package:app/view/widgets/custom_input.dart';
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
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: _.backgroundColor,
            body: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 90),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_white.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: CustomInput(inputTittle: 'Email:'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 19),
                    child: CustomInput(inputTittle: 'Senha:'),
                  ),
                  CustomSmallButton(
                    tittleBtn: 'LOGIN',
                    customMargin: 80,
                    function: () => Get.toNamed('/feed'),
                  ),
                  CustomTextButton(
                    tittle: 'CADASTRAR',
                    function: () => Get.toNamed('/register'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

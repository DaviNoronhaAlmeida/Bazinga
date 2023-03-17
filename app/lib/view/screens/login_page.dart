import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_small_button.dart';
import 'package:app/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/services/login_service.dart';
import '../styles/app_colors.dart';
import '../../model/authentication/token.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    child: CustomInput(
                      inputTittle: 'Email:',
                      controller: _emailController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 19),
                    child: CustomInput(
                      inputTittle: 'Senha:',
                      controller: _passwordController,
                    ),
                  ),
                  GetBuilder<Token>(
                    init: Token(),
                    builder: (tokenController) {
                      return CustomSmallButton(
                        tittleBtn: 'LOGIN',
                        customMargin: 80,
                        function: () => {
                          login(_emailController.text, _passwordController.text,
                              tokenController.token)
                        },
                      );
                    },
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

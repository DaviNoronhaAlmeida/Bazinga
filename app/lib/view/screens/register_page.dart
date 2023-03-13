import 'package:app/view-model/validators/email_validator.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_small_button.dart';
import 'package:app/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final AppColors _appColors = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _appColors.backgroundColor,
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
                margin: const EdgeInsets.only(top: 42.5),
                child: CustomInput(
                  inputTittle: 'Nome de usuário:',
                  controller: _nameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 19.5),
                child: CustomInput(
                  inputTittle: 'Email:',
                  controller: _emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 19.5),
                child: CustomInput(
                  inputTittle: 'Senha:',
                  controller: _passwordController,
                ),
              ),
              CustomSmallButton(
                tittleBtn: 'CADASTRAR',
                customMargin: 70,
                function: () => {
                  if (emailValidate(_emailController.text))
                    {
                      Get.toNamed('/'),
                    },
                },
              ),
              CustomTextButton(
                tittle: 'VOLTAR',
                function: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

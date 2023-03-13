import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class DeleteProfilePage extends StatelessWidget {
  DeleteProfilePage({super.key});
  final AppColors _appColors = Get.find();
  final TextEditingController _passwordController = TextEditingController();

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
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //Ícone e nome do grupo
                  Row(
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

                  //Texto
                  const Spacer(),
                  Text(
                    'Tem certeza que deseja excluir a conta? :(',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: _appColors.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),

                  CustomInput(
                    inputTittle: 'Senha:',
                    controller: _passwordController,
                  ),

                  //Botão de Salvar
                  const Spacer(),
                  const Spacer(),
                  CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 0,
                    function: () => Get.back(),
                  ),
                ],
              ),
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

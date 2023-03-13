import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_icon.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class EditProfileIconPage extends StatelessWidget {
  EditProfileIconPage({super.key});
  final AppColors _appColors = Get.find();
  final ScrollController _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColors.backgroundColor,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
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

                //Icons
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Ícones:',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: _appColors.textColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: RawScrollbar(
                    thumbVisibility: true,
                    thickness: 5,
                    controller: _scroll,
                    child: SingleChildScrollView(
                      controller: _scroll,
                      child: Column(
                        children: [
                          ChooseIcon(),
                        ],
                      ),
                    ),
                  ),
                ),

                //Botão de Salvar
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
    );
  }
}

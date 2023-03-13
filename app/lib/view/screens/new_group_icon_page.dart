import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class NewGroupIconPage extends StatelessWidget {
  NewGroupIconPage({super.key});
  final ScrollController _scroll = ScrollController();

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
            CustomInput(inputTittle: 'Nome do Grupo:'),

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
            Container(
              height: 350,
              child: RawScrollbar(
                thumbVisibility: true,
                thickness: 5,
                controller: _scroll,
                child: SingleChildScrollView(
                  controller: _scroll,
                  child: Column(
                    children: [
                      //Users Found
                      ChooseIcon(),
                    ],
                  ),
                ),
              ),
            ),

            //Next button
            const Spacer(),
            CustomBigButton(
              tittleBtn: 'CRIAR GRUPO',
              customMargin: 15,
              function: () => Get.toNamed('/groupHome'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

import 'package:app/view/widgets/custom_big_input.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({super.key});

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
            appBar: CustomAppBar(),
            resizeToAvoidBottomInset: false,
            backgroundColor: _.backgroundColor,
            body: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 50),
                child: Column(
                  children: [
                    CustomBigInput(inputTittle: 'Nova Publicação:'),
                    const Spacer(),
                    CustomBigButton(
                      tittleBtn: 'PUBLICAR',
                      customMargin: 15,
                      function: () => Get.toNamed('/feed'),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomNavBar(),
          ),
        );
      },
    );
  }
}

import 'package:app/view/styles/app_colors.dart';
import 'package:app/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomDialog(BuildContext context) {
  // ignore: no_leading_underscores_for_local_identifiers
  final AppColors _appColors = Get.find();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: _appColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'Cadastrado com sucesso!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: _appColors.textColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CustomTextButton(
                tittle: 'ENTRAR',
                function: () => Get.toNamed('/'),
              )
            ],
          ),
        ),
      );
    },
  );
}

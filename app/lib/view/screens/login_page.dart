import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_input.dart';
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
          appBar: CustomAppBar(),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: CustomInput(
                    inputTittle: 'Senha:',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

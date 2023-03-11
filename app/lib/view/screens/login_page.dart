import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import '../widgets/modal_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppColors>(
      init: AppColors(),
      builder: (_) {
        return const Center(
          child: Modal(),
        //   child: TextButton(
        //     onPressed: () => _.change(),
        //     style: TextButton.styleFrom(
        //       backgroundColor: _.redColor,
        //     ),
        //     child: Text(
        //       'LOGIN',
        //       style: TextStyle(color: _.textBtnColor),
        //     ),
        //   ),
        );
      },
    );
  }
}

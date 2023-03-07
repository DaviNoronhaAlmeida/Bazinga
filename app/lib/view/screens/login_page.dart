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
        return Center(
          child: TextButton(
            onPressed: () => _.change(),
            style: TextButton.styleFrom(
              backgroundColor: _.background,
            ),
            child: const Text(
              'texto',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}

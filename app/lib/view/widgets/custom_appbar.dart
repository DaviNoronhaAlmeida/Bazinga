import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({super.key});
  final AppColors _appColors = Get.find();

  @override
  Size get preferredSize => const Size.fromHeight(59.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _appColors.barColor,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo_white.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Container(
        alignment: Alignment.centerRight,
        child: Text(
          'Usuário',
          style: TextStyle(
            color: _appColors.textBtnColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';
import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({super.key});
  final AppColors _appColors = Get.find();
  final userName = Get.find<Info>().name;

  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _appColors.barColor.value,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo_white.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(
            userName,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textBtnColor.value,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';
import '../styles/app_colors.dart';

class CustomGroupAppBar extends StatelessWidget with PreferredSizeWidget {
  final String groupName;

  CustomGroupAppBar({
    Key? key,
    required this.groupName,
  }) : super(key: key);

  final AppColors _appColors = Get.find();
  final userName = Get.find<Info>().name;

  @override
  Size get preferredSize => const Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _appColors.barColor.value,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Container(
          padding: const EdgeInsets.only(top: 20),
          constraints: const BoxConstraints(maxWidth: 210),
          child: Text(
            groupName.length > 17
                ? "${groupName.substring(0, 17)}..."
                : groupName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
          /* const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ), */
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

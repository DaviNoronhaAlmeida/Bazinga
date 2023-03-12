import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: _appColors.barColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => Get.toNamed('/feed'),
            child: Icon(
              Icons.home_outlined,
              color: _appColors.redColor,
              size: 25,
            ),
          ),
          Container(
            height: 25,
            width: 2,
            decoration: BoxDecoration(
              color: _appColors.bgPostsColor,
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed('/'),
            child: Icon(
              Icons.groups_outlined,
              color: _appColors.redColor,
              size: 25,
            ),
          ),
          Container(
            height: 25,
            width: 2,
            decoration: BoxDecoration(
              color: _appColors.bgPostsColor,
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed('/'),
            child: Icon(
              Icons.person_outline,
              color: _appColors.redColor,
              size: 25,
            ),
          ),
          Container(
            height: 25,
            width: 2,
            decoration: BoxDecoration(
              color: _appColors.bgPostsColor,
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed('/'),
            child: Icon(
              Icons.settings_outlined,
              color: _appColors.redColor,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

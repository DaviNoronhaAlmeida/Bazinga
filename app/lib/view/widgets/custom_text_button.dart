import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String tittle;
  final VoidCallback function;

  CustomTextButton({super.key, required this.tittle, required this.function});
  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 23),
      child: TextButton(
        onPressed: function,
        child: Text(
          tittle,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: _appColors.redColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomSmallButton extends StatelessWidget {
  final String tittleBtn;
  final double customMargin;
  final VoidCallback function;

  CustomSmallButton(
      {super.key,
      required this.tittleBtn,
      required this.customMargin,
      required this.function});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: customMargin),
      width: 170,
      height: 42,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _appColors.redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: function,
        child: Center(
          child: Text(
            tittleBtn,
            style: TextStyle(
              color: _appColors.textBtnColor,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }
}

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
          backgroundColor: _appColors.redColor.value,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: function,
        child: Center(
          child: Text(
            tittleBtn,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textBtnColor.value,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

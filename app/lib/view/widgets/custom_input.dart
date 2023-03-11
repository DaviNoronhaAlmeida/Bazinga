import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String inputTittle;
  CustomInput({super.key, required this.inputTittle});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            inputTittle,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textColor,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 36,
          width: 320,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _appColors.redColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _appColors.redColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

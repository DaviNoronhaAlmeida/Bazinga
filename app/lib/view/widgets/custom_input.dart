import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String inputTittle;
  final bool hide;
  final TextEditingController controller;
  CustomInput(
      {super.key,
      required this.inputTittle,
      required this.controller,
      required this.hide});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            inputTittle,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textColor.value,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 36,
          width: 320,
          child: TextField(
            controller: controller,
            obscureText: hide,
            inputFormatters: [
              LengthLimitingTextInputFormatter(50),
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: _appColors.redColor.value, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: _appColors.redColor.value, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Roboto',
              color: _appColors.textColor.value,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomBigInput extends StatelessWidget {
  final String inputTittle;
  final TextEditingController controller;
  CustomBigInput(
      {super.key, required this.inputTittle, required this.controller});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.only(bottom: 10),
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
            width: 320,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: TextField(
                maxLines: 16,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: _appColors.redColor, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: _appColors.redColor, width: 2),
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
          ),
        ],
      ),
    );
  }
}

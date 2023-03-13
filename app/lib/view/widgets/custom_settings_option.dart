import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomSettingsOption extends StatelessWidget {
  final VoidCallback function;
  final String tittle;
  final String description;

  CustomSettingsOption(
      {super.key,
      required this.function,
      required this.tittle,
      required this.description});
  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 304,
      child: TextButton(
        onPressed: function,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tittle,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: _appColors.textColor,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: _appColors.descriptionColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

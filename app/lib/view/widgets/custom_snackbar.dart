import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void show(String message) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: const Color.fromRGBO(235, 47, 22, 1),
        messageText: Text(
          message,
          style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        icon: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 47, 22, 1),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 1),
              width: 2.5,
            ),
          ),
          width: 33,
          height: 33,
          child: const Center(
            child: Text(
              '!',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w500,
                fontSize: 23,
              ),
            ),
          ),
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        borderRadius: 5,
      ),
    );
  }
}

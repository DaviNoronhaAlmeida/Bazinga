import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  final AppColors customColors = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      AlertDialog(
          title: Text('TextField in Dialog'),
          content: TextField(
            onChanged: (value) { },
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Text Field in Dialog"),
          ),
        ),

    );
  }
}
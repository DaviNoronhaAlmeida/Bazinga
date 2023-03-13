import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class CustomChat extends StatelessWidget {
  final String username;
  final String postText;
  final double leftMarging;
  final double rightMarging;

  CustomChat(
      {super.key,
      required this.username,
      required this.postText,
      required this.leftMarging,
      required this.rightMarging});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: leftMarging, right: rightMarging),
        child: Column(
          children: [
            // Nome de usuário e ícone
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text: TextSpan(
                      text: username,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: _appColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Post
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                  color: _appColors.bgPostsColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      postText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: _appColors.textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

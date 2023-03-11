import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class PostView extends StatelessWidget {
  PostView({super.key});

  final AppColors customColors = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: customColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
          child: Center(
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
                          text: 'Usuário',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: customColors.textColor,
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
                    decoration: BoxDecoration(
                      color: customColors.bgPostsColor,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      child: Text(
                              'Meu nome é Yoshikage Kira. Tenho 33 anos. Minha casa fica na parte nordeste de Morioh, onde todas as casas estão, e eu não sou casado.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: customColors.textColor,
                          ),
                      ),
                    ),
                  ),
                ),

                //Likes
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: customColors.redColor,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            text: '1',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: customColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

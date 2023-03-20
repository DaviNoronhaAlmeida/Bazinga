import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';
import '../styles/app_colors.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AppColors _appColors = Get.find();
  final userName = Get.find<Info>().name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Título
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        text: userName,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: _appColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Feed
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: CustomPost(
                postId: 'id',
                username: 'Usuário',
                postText:
                    'Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.',
                likes: 1,
                likingUsers: [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(color: _appColors.dividerColor, thickness: 2),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: CustomPost(
                postId: 'id',
                username: 'Usuário',
                postText: 'Textinho de Post.',
                likes: 1,
                likingUsers: [],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appColors.redColor,
        onPressed: () {
          Get.toNamed('/newPost');
        },
        child: const Icon(Icons.post_add, size: 30),
      ),
    );
  }
}

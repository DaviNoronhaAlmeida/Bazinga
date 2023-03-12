import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: CustomPost(
                  username: 'Usuário',
                  postText:
                      'Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.Textinho de Post.',
                  likes: 1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(color: _appColors.dividerColor, thickness: 2),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: CustomPost(
                  username: 'Usuário', postText: 'Textinho de Post.', likes: 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

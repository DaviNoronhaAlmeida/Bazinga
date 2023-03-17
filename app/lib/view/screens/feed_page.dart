import 'package:app/view-model/controllers/feed_controller.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class FeedPage extends StatelessWidget {
  FeedPage({super.key});

  final AppColors _appColors = Get.find();
  final FeedController _feedController = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor,
      appBar: CustomAppBar(),
      body: Obx(() {
        // ignore: invalid_use_of_protected_member, unnecessary_nullable_for_final_variable_declarations
        final List<dynamic>? feedData = _feedController.feedData.value;
        if (feedData != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                for (var post in feedData)
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: CustomPost(
                          username: post['id_creator']['nick'],
                          postText: post['content'],
                          likes: int.tryParse(post['likes'].toString()) ?? 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Divider(
                          color: _appColors.dividerColor,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
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

import 'package:app/view-model/controllers/profile_controller.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/user_info.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../styles/app_colors.dart';
import 'dart:core';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AppColors _appColors = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());
  final RefreshController _refreshController = RefreshController();
  final nick = Get.find<Info>().name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Obx(() {
        final List<dynamic>? profileData = _profileController.profileData.value;
        if (profileData != null) {
          return SmartRefresher(
            controller: RefreshController(),
            onRefresh: () {
              Future.delayed(Duration(seconds: 2)).then((_) {
                _refreshController.refreshCompleted();
              });
              _profileController.loadProfile();
            },
            child: SingleChildScrollView(
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
                              text: nick,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                                color: _appColors.textColor.value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //FEED
                  for (var post in profileData.reversed)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomPost(
                            postId: post['_id'],
                            username: post['id_creator'] != null
                                ? post['id_creator']['nick']
                                : '',
                            postText: post['content'],
                            likes: post['likes'] != null
                                ? post['likes'].length
                                : 0,
                            likingUsers: post['likes'] != null
                                ? List<String>.from(post['likes']
                                    .map((like) => like['nick'].toString()))
                                : [],
                            likedId: post['likes'] != null
                                ? List<String>.from(post['likes']
                                    .map((like) => like['_id'].toString()))
                                : [],
                            img: post.containsKey('img') && post['img'] != ""
                                ? post['img'].toString()
                                : null,
                            comments: post['comments'] != null
                                ? post['comments'].length
                                : 0,
                            commentUser: post['comments'] != null
                                ? List<String>.from(post['comments'].map(
                                    (comment) => comment['id_creator']['nick']
                                        .toString()))
                                : [],
                            commentContent: post['comments'] != null
                                ? List<String>.from(post['comments'].map(
                                    (comment) => comment['content'].toString()))
                                : [],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Divider(
                            color: _appColors.dividerColor.value,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appColors.redColor.value,
        onPressed: () {
          Get.toNamed('/newPost');
        },
        child: const Icon(Icons.post_add, size: 30),
      ),
    );
  }
}

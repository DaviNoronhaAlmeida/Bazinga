import 'package:app/config/base.dart';
import 'package:app/view-model/controllers/feed_controller.dart';
import 'package:app/view-model/utils/token.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
// ignore: depend_on_referenced_packages
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:core';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  ScrollController _controllerScroll = ScrollController(keepScrollOffset: true);
  final AppColors _appColors = Get.put(AppColors());
  final FeedController _feedController = Get.put(FeedController());
  final RefreshController _refreshController = RefreshController();
  late IO.Socket socket;
  final Token _token = Get.find();

  void _scrollTop() {
    setState(() {
      _controllerScroll.animateTo(
        _controllerScroll.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Novas Postagens'),
        backgroundColor: const Color.fromRGBO(2, 80, 0, 0.95),
        action: SnackBarAction(
            label: 'Atualizar',
            onPressed: () {
              _feedController.loadFeed();
              _scrollTop();
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    socket = IO.io(Base().url, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': {
        'Authorization': 'Bearer ${_token.token}',
      }
    });
    socket.onConnect((_) {
      // _idGroup = Get.put(GroupId());
      socket.connect();
    });
    socket.on('posts', (data) async {
      _showToast(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Obx(() {
        // ignore: invalid_use_of_protected_member, unnecessary_nullable_for_final_variable_declarations
        final List<dynamic>? feedData = _feedController.feedData.value;
        if (feedData != null) {
          return SmartRefresher(
            controller: _refreshController,
            onRefresh: () {
              Future.delayed(const Duration(seconds: 2)).then((_) {
                _refreshController.refreshCompleted();
              });
              _feedController.loadFeed();
            },
            child: ListView.builder(
              controller: _controllerScroll,
              // padding: const EdgeInsets.all(20),
              itemCount: feedData.length,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomPost(
                            postId: feedData[index]['_id'],
                            username: feedData[index]['id_creator'] != null
                                ? feedData[index]['id_creator']['nick']
                                : '',
                            postText: feedData[index]['content'],
                            likes: feedData[index]['likes'] != null
                                ? feedData[index]['likes'].length
                                : 0,
                            likingUsers: feedData[index]['likes'] != null
                                ? List<String>.from(feedData[index]['likes']
                                    .map((like) => like['nick'].toString()))
                                : [],
                            likedId: feedData[index]['likes'] != null
                                ? List<String>.from(feedData[index]['likes']
                                    .map((like) => like['_id'].toString()))
                                : [],
                            img: feedData[index].containsKey('img') &&
                                    feedData[index]['img'] != ""
                                ? feedData[index]['img'].toString()
                                : null,
                            comments: feedData[index]['comments'] != null
                                ? feedData[index]['comments'].length
                                : 0,
                            commentUser: feedData[index]['comments'] != null
                                ? List<String>.from(feedData[index]['comments']
                                    .map((comment) => comment['id_creator']
                                            ['nick']
                                        .toString()))
                                : [],
                            commentContent: feedData[index]['comments'] != null
                                ? List<String>.from(feedData[index]['comments']
                                    .map((comment) =>
                                        comment['content'].toString()))
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
                );
              },
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

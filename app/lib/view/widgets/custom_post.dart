import 'package:app/model/feed_functions/like_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import 'package:app/view/widgets/custom_liking_user.dart';
import '../../view-model/utils/token.dart';
import '../../view-model/services/new_comment_service.dart';
import 'package:app/view-model/controllers/feed_controller.dart';
import '../../view-model/utils/user_info.dart';

// ignore: must_be_immutable
class CustomPost extends StatelessWidget {
  final String postId;
  final String username;
  final String postText;
  final int likes;
  final List<String> likingUsers;
  final List<String> likedId;
  final int comments;
  List<String> commentUser;
  List<String> commentContent;
  final String? img;

  CustomPost({
    Key? key,
    required this.postId,
    required this.username,
    required this.postText,
    required this.likes,
    required this.likingUsers,
    required this.likedId,
    required this.comments,
    required this.commentUser,
    required this.commentContent,
    this.img,
  }) : super(key: key);

  final myId = Get.find<Info>().id;
  final myName = Get.find<Info>().name;

  Future<void> updateFeed() async {
    final FeedController feedController = Get.find();
    feedController.loadFeed();
  }

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    final TextEditingController commentController = TextEditingController();
    TextEditingController likesController = TextEditingController();
    likesController.text = likes.toString();
    int totalLikes = likes;

    TextEditingController commentsController = TextEditingController();
    commentsController.text = comments.toString();

    // ignore: no_leading_underscores_for_local_identifiers
    void _showCommentsSection(BuildContext context, List<String> commentUser,
        List<String> commentContent) {
      final AppColors appColors = Get.find();
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appColors.backgroundColor.value,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comentários",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: appColors.textColor.value,
                    ),
                  ),

                  const SizedBox(height: 16),
                  //ERRO
                  /* Expanded( */
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    child: SizedBox(
                      height: 420,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: commentUser.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    commentUser[index],
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: appColors.textColor.value,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: appColors.bgPostsColor.value,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  width: maxWidth,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      commentContent[index],
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: appColors.textColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  //INPUT
                  const Spacer(),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 70,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 280,
                              alignment: Alignment.center,
                              child: TextField(
                                maxLines: null,
                                onSubmitted: (_) {
                                  FocusScope.of(context).unfocus();
                                },
                                controller: commentController,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _appColors.redColor.value,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: _appColors.redColor.value,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: _appColors.textColor.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 40,
                              alignment: Alignment.bottomLeft,
                              child: FloatingActionButton(
                                backgroundColor: _appColors.redColor.value,
                                onPressed: () async {
                                  dynamic sendToken = Get.find<Token>().token;
                                  newComment(commentController.text.trim(),
                                      sendToken, postId);
                                  await updateFeed();

                                  commentUser.insert(comments, myName);
                                  commentContent.insert(
                                      comments, commentController.text.trim());
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                  commentController.clear();
                                  // ignore: use_build_context_synchronously
                                  _showCommentsSection(
                                      context, commentUser, commentContent);
                                },
                                child:
                                    const Icon(Icons.arrow_forward, size: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Center(
      child: Column(
        children: [
          // Nome de usuário e ícone
          Row(
            children: [
              /* const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 40,
              ), */
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(
                    text: username,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: _appColors.textColor.value,
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
                color: _appColors.bgPostsColor.value,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      postText,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: _appColors.textColor.value,
                      ),
                    ),
                    if (img != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 300,
                          child: Image.network(
                            '$img',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          //Likes
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(
              children: [
                //LikeIcon
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(const Size(20, 20)),
                  iconSize: 20,
                  icon: likedId.contains(myId)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  color: _appColors.redColor.value,
                  onPressed: () async {
                    final response = await likePostReq(postId);
                    if (response['content'] == '+1') {
                      totalLikes += 1;
                      likesController.text = totalLikes.toString();
                      updateFeed();
                    } else {
                      totalLikes -= 1;
                      likesController.text = totalLikes.toString();
                      updateFeed();
                    }
                  },
                ),

                //Número
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),

                      onPressed: () {
                        likingUsers.isNotEmpty
                            ? showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: _appColors.barColor.value,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              minHeight: 0,
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              minWidth: 0,
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  // Dentro do modal
                                                  for (String username
                                                      in likingUsers)
                                                    LikingUser(
                                                        username: username,
                                                        icon:
                                                            'Endereço do ícone'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        //Botão de fechar
                                        Positioned(
                                          top: 10.0,
                                          right: 10.0,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: _appColors.redColor.value,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : null;
                      },
                      //Número de likes
                      child: Text(
                        likesController.text,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: _appColors.textColor.value,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 40,
                ),
                //CommentIcon
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(const Size(20, 20)),
                  iconSize: 20,
                  icon: const Icon(Icons.comment_outlined),
                  color: _appColors.redColor.value,
                  onPressed: () async {
                    _showCommentsSection(context, commentUser, commentContent);
                  },
                ),

                //Número
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: TextButton(
                    onPressed: () {
                      _showCommentsSection(
                          context, commentUser, commentContent);
                    },
                    child: Text(
                      commentsController.text,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: _appColors.textColor.value,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

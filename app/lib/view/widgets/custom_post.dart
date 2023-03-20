import 'package:app/model/feed_functions/like_req.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import 'package:app/view/widgets/custom_liking_user.dart';

class CustomPost extends StatelessWidget {
  final String postId;
  final String username;
  final String postText;
  final int likes;
  final List<String> likingUsers;
  final String? img;

  CustomPost({
    Key? key,
    required this.postId,
    required this.username,
    required this.postText,
    required this.likes,
    required this.likingUsers,
    this.img,
  }) : super(key: key);

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController _likesController = TextEditingController();
    _likesController.text = likes.toString();
    int totalLikes = likes;
    void _updateLikes() {
      totalLikes = int.parse(_likesController.text);
    }

    return Center(
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
              decoration: BoxDecoration(
                color: _appColors.bgPostsColor,
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
                        color: _appColors.textColor,
                      ),
                    ),
                    if (img != null)
                      SizedBox(
                        width: 300,
                        child: Image.network(
                          '$img',
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          //Likes
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(const Size(20, 20)),
                  iconSize: 20,
                  icon: const Icon(Icons.favorite_border),
                  color: _appColors.redColor,
                  onPressed: () async {
                    final response = await likePostReq(postId);
                    if (response['content'] == '+1') {
                      totalLikes += 1;
                      _likesController.text = totalLikes.toString();
                    } else {
                      totalLikes -= 1;
                      _likesController.text = totalLikes.toString();
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
                                    backgroundColor: _appColors.barColor,
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
                                              color: _appColors.redColor,
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
                        _likesController.text,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: _appColors.textColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
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

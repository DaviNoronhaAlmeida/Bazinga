import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import 'package:app/view/widgets/custom_likingUser.dart';

class CustomPost extends StatelessWidget {
  final String username;
  final String postText;
  final int likes;

  CustomPost(
      {super.key,
      required this.username,
      required this.postText,
      required this.likes});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
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
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Text(
                  postText,
                  textAlign: TextAlign.center,
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
                  onPressed: () {},
                ),
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
                        showDialog(
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
                                        maxHeight:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        minWidth: 0,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            // Dentro do modal
                                            LikingUser(
                                                username: 'Usuário',
                                                icon: 'Endereço do ícone'),
                                            const SizedBox(height: 10),
                                            LikingUser(
                                                username: 'Usuário de novo',
                                                icon: 'Endereço do ícone'),
                                            const SizedBox(height: 10),
                                            LikingUser(
                                                username: 'Outro Usuário',
                                                icon: 'Endereço do ícone'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                        );
                      },
                      child: Text(
                        likes.toString(),
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontFamily: 'Roboto', color: _appColors.textColor),
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

import 'package:app/view-model/services/search_user_id_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class AddMember extends StatelessWidget {
  final String username;
  final String icon;

  AddMember({super.key, required this.username, required this.icon});

  final AppColors _appColors = Get.find();
  final SearchUsersId usersId = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: _appColors.bgPostsColor.value,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        /* const Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 50,
                        ), */
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                text: username.length > 20
                                    ? "${username.substring(0, 20)}..."
                                    : username,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: _appColors.textColor.value,
                                ),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          color: _appColors.textColor.value,
                          onPressed: () async {
                            await usersId.search(username);
                            Get.back();
                          },
                        ),
                      ],
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

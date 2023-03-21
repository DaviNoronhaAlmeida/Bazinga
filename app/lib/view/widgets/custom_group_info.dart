import 'package:app/view-model/utils/group_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/authentication/group_id_req.dart';
import '../styles/app_colors.dart';

class GroupInfo extends StatelessWidget {
  final String groupName;
  final String icon;
  final String lastMessage;
  final String id;

  GroupInfo(
      {super.key,
      required this.groupName,
      required this.id,
      required this.icon,
      required this.lastMessage});

  final AppColors _appColors = Get.find();

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
                child: GestureDetector(
                  onTap: () {
                    print(this.id);
                    Get.toNamed('/groupChat');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _appColors.bgPostsColor.value,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.5),
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
                          const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: groupName,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: _appColors.textColor.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: id,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: _appColors.descriptionColor.value,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

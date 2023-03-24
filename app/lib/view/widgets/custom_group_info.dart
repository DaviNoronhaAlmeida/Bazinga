import 'package:app/model/chat_functions/select_groups_req.dart';
import 'package:app/view-model/utils/group_id.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

// ignore: must_be_immutable
class GroupInfo extends StatelessWidget {
  final String groupName;
  final String icon;
  final String lastMessage;
  final String id;
  dynamic messages;
  final List<dynamic> members;

  GroupInfo(
      {super.key,
      required this.groupName,
      required this.id,
      required this.icon,
      required this.lastMessage,
      required this.messages,
      required this.members});

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
                  onTap: () async {
                    await selectGroupReq(id);
                    GroupId group = Get.put(GroupId());
                    group.setName(groupName);
                    group.setMembers(members);
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
                          /* const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 50,
                          ), */
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: RichText(
                                    text: TextSpan(
                                      text: groupName.length > 20
                                          ? "${groupName.substring(0, 20)}..."
                                          : groupName,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22,
                                        color: _appColors.textColor.value,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              /* Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: lastMessage,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: _appColors.descriptionColor.value,
                                    ),
                                  ),
                                ),
                              ), */
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

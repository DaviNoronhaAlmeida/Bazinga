import 'package:app/view-model/services/change_member_service.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/group_id.dart';
import '../styles/app_colors.dart';

class EditGroupRemoveMemberPage extends StatelessWidget {
  EditGroupRemoveMemberPage({super.key});
  final AppColors _appColors = Get.find();
  final GroupId groupInfo = Get.find();

  @override
  Widget build(BuildContext context) {
    List<dynamic> members = groupInfo.members;
    List<dynamic> excluded = [].obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //Search User
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Membros:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: _appColors.textColor.value,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(255, 0, 0, 0)
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
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: RichText(
                                                text: TextSpan(
                                                  text: members[index]['nick']
                                                              .length >
                                                          20
                                                      ? "${members[index]['nick'].substring(0, 20)}..."
                                                      : members[index]['nick'],
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    color: _appColors
                                                        .textColor.value,
                                                  ),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 30,
                                            ),
                                            color: _appColors.textColor.value,
                                            onPressed: () {
                                              excluded
                                                  .add(members[index]['nick']);
                                              members.remove(members[index]);
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
                    },
                  ),
                ),

                //Added list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                      color: _appColors.dividerColor.value, thickness: 2),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Obx(
                    () => Text(
                      'Membros selecionados: ${excluded.length}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: _appColors.descriptionColor.value,
                      ),
                    ),
                  ),
                ),

                //Next button
                CustomBigButton(
                  tittleBtn: 'SALVAR',
                  customMargin: 15,
                  function: () {
                    groupInfo.setMembers(members);
                    changeMembers(
                        groupInfo.groupName, members, groupInfo.groupId);
                    excluded = [];
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            child: SizedBox(
              width: 40,
              child: FloatingActionButton(
                backgroundColor: _appColors.redColor.value,
                onPressed: () {
                  Get.toNamed('/editGroup');
                },
                child: const Icon(Icons.arrow_back, size: 30),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

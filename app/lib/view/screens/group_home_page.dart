import 'package:app/view-model/controllers/groups_controller.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_group_info.dart';
// ignore: depend_on_referenced_packages
//import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class GroupHomePage extends StatelessWidget {
  GroupHomePage({super.key});

  final AppColors _appColors = Get.find();
  final GroupsController _groupController = Get.put(GroupsController());
  //final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: RichText(
                text: TextSpan(
                  text: 'Meus Grupos de Chat',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: _appColors.textColor.value,
                  ),
                ),
              ),
            ),
            Obx(() {
              // ignore: invalid_use_of_protected_member, unnecessary_nullable_for_final_variable_declarations
              final List<dynamic>? groupData = _groupController.groupData.value;
              if (groupData != null) {
                return Expanded(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: groupData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final group = groupData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GroupInfo(
                          groupName: group['name'],
                          id: group['_id'],
                          icon: 'Endereço do ícone',
                          lastMessage: group['messages'].isNotEmpty
                              ? group['messages'].last['text']
                              : "",
                          messages: group['messages'],
                          members: group['members'],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appColors.redColor.value,
        onPressed: () {
          Get.toNamed('/newGroup');
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

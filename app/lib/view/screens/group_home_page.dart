import 'package:app/view-model/controllers/groups_controller.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_group_info.dart';
// ignore: depend_on_referenced_packages
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class GroupHomePage extends StatelessWidget {
  GroupHomePage({super.key});

  final AppColors _appColors = Get.find();
  final RefreshController _refreshController = RefreshController();
  final GroupsController _groupController = Get.put(GroupsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Obx(() {
        final List<dynamic>? groupData = _groupController.groupData.value;
        if (groupData != null) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                for (var group in groupData)
                  GroupInfo(
                    groupName: group['name'],
                    id: group['_id'],
                    icon: 'Endereço do ícone',
                    lastMessage: "group['messages'][0]",
                  ),
                const SizedBox(height: 10),
              ],
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
          Get.toNamed('/newGroup');
        },
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}

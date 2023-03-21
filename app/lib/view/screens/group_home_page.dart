import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_group_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/controllers/groups_controller.dart';
import '../styles/app_colors.dart';

class GroupHomePage extends StatelessWidget {
  GroupHomePage({super.key});

  final AppColors _appColors = Get.find();
  final ListGroupsController _groupsController =
      Get.put(ListGroupsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Obx(
        () {
          // ignore: invalid_use_of_protected_member, unnecessary_nullable_for_final_variable_declarations
          final List<dynamic>? groupData = _groupsController.groupsData.value;
          if (groupData != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  for (var group in groupData)
                    GroupInfo(
                      groupName: group['name'],
                      icon: 'Endereço do ícone',
                      lastMessage: 'Última mensagem enviada',
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
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

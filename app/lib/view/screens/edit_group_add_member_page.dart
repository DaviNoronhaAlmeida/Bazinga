import 'package:app/view-model/services/change_member_service.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_add_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../view-model/services/search_service.dart';
import '../../view-model/services/search_user_id_service.dart';
import '../../view-model/utils/group_id.dart';
import '../styles/app_colors.dart';

class EditGroupAddMemberPage extends StatelessWidget {
  EditGroupAddMemberPage({super.key});
  final AppColors _appColors = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final GroupId groupInfo = Get.find();
  final SearchUsersId usersId = Get.put(SearchUsersId());

  @override
  Widget build(BuildContext context) {
    usersId.users = <String>[];
    void showResults(BuildContext context, List<dynamic> search) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var user in search)
                            AddMember(
                                username: user['suggestion'], icon: 'icon'),
                        ],
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                        padding: const EdgeInsets.only(bottom: 10, top: 30),
                        child: Text(
                          'Pesquisar Usuário:',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: _appColors.textColor.value,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 320,
                        child: TextField(
                          controller: _nameController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50),
                          ],
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _appColors.redColor.value, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _appColors.redColor.value, width: 2),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              padding: const EdgeInsets.all(5),
                              color: _appColors.textColor.value,
                              icon: const Icon(Icons.search),
                              onPressed: () async {
                                if (_nameController.text.isNotEmpty) {
                                  var result = await Search()
                                      .search(_nameController.text);
                                  // ignore: use_build_context_synchronously
                                  showResults(context, result);
                                }
                              },
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
                    ],
                  ),

                  //Added list
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                        color: _appColors.dividerColor.value, thickness: 2),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: 'Usuários adicionados',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: _appColors.descriptionColor.value,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GetBuilder<SearchUsersId>(
                            init: SearchUsersId(),
                            builder: (context) {
                              return Text(
                                'Escolhidos: ${context.users.length}',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: _appColors.descriptionColor.value,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Next button
                  CustomBigButton(
                    tittleBtn: 'SALVAR',
                    customMargin: 15,
                    function: () {
                      List<dynamic> memb = groupInfo.members;
                      List<dynamic> membAdd = usersId.users;
                      memb.addAll(membAdd);

                      groupInfo.setMembers(memb);
                      usersId.users = <String>[];
                      changeMembers(groupInfo.groupName, groupInfo.members,
                          groupInfo.groupId);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: SizedBox(
                width: 40,
                child: FloatingActionButton(
                  backgroundColor: _appColors.redColor.value,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, size: 30),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}

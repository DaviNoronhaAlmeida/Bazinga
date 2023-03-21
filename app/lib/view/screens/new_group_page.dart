import 'package:app/view-model/services/search_service.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import 'package:app/view/widgets/custom_add_member.dart';
import 'package:app/view/widgets/custom_added_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class NewGroupPage extends StatelessWidget {
  NewGroupPage({super.key});

  final AppColors _appColors = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final Search _searchController = Get.put(Search());

  @override
  Widget build(BuildContext context) {
    final RxList<dynamic>? searchData = _searchController.searchData;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _appColors.backgroundColor.value,
      appBar: CustomAppBar(),
      body: Container(
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
                        onPressed: () => {
                          if (_nameController.text.isNotEmpty)
                            {
                              Search().search(_nameController.text),
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

            SizedBox(
              height: 285,
              child: Obx(
                () {
                  if (searchData != null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //Users Found
                          for (var user in searchData)
                            AddMember(
                              username: user['suggestion'],
                              icon: 'Endereço do ícone',
                            ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),

            //Added list
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child:
                  Divider(color: _appColors.dividerColor.value, thickness: 2),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
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
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          AddedMember(
                              username: 'Usuário 1', icon: 'Endereçodo ícone'),
                          const SizedBox(width: 10),
                          AddedMember(
                              username: 'Usuário 2', icon: 'Endereçodo ícone'),
                          const SizedBox(width: 10),
                          AddedMember(
                              username: 'Usuário 3', icon: 'Endereçodo ícone'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Next button
            CustomBigButton(
              tittleBtn: 'PRÓXIMO',
              customMargin: 15,
              function: () => Get.toNamed('/newGroupIcon'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

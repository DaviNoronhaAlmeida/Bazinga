import 'package:app/view-model/services/create_group_service.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_input.dart';
import 'package:app/view/widgets/custom_big_button.dart';
//import 'package:app/view/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/controllers/groups_controller.dart';
import '../../view-model/services/search_user_id_service.dart';
import '../../view-model/validators/name_validator.dart';
import '../styles/app_colors.dart';

class NewGroupIconPage extends StatelessWidget {
  NewGroupIconPage({super.key});
  //final ScrollController _scroll = ScrollController();

  final AppColors _appColors = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final SearchUsersId usersId = Get.find();
  final GroupsController groups = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _appColors.backgroundColor.value,
        appBar: CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                //Search User
                CustomInput(
                  inputTittle: 'Nome do Grupo:',
                  controller: _nameController,
                  hide: false,
                ),

                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20),
                //     child: Text(
                //       'Ícones:',
                //       style: TextStyle(
                //         fontFamily: 'Roboto',
                //         color: _appColors.textColor.value,
                //         fontSize: 19,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 350,
                //   child: RawScrollbar(
                //     thumbVisibility: true,
                //     thickness: 5,
                //     controller: _scroll,
                //     child: SingleChildScrollView(
                //       controller: _scroll,
                //       child: Column(
                //         children: [
                //           ChooseIcon(),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

                //Next button
                const Spacer(),
                CustomBigButton(
                  tittleBtn: 'CRIAR GRUPO',
                  customMargin: 15,
                  function: () {
                    if (nameValidate(_nameController.text)) {
                      createGroup(_nameController.text, usersId.users);
                      groups.loadFeed();
                      usersId.users = [];
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}

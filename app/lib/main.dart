import 'package:app/view/screens/login_page.dart';
import 'package:app/view/screens/register_page.dart';
import 'package:app/view/screens/feed_page.dart';
import 'package:app/view/screens/new_post_page.dart';
import 'package:app/view/screens/group_home_page.dart';
import 'package:app/view/screens/new_group_page.dart';
import 'package:app/view/screens/new_group_icon_page.dart';
import 'package:app/view/screens/group_chat_page.dart';
import 'package:app/view/screens/edit_group_page.dart';
import 'package:app/view/screens/edit_group_name_page.dart';
import 'package:app/view/screens/edit_group_icon_page.dart';
import 'package:app/view/screens/edit_group_member_page.dart';
import 'package:app/view/screens/delete_group_page.dart';
import 'package:app/view/screens/profile_page.dart';
import 'package:app/view/screens/settings_page.dart';
import 'package:app/view/screens/edit_profile_name_email_page.dart';
import 'package:app/view/screens/edit_profile_icon_page.dart';
import 'package:app/view/screens/edit_profile_password_page.dart';
import 'package:app/view/screens/delete_profile_page.dart';
import 'package:app/view/screens/teste.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
        ),
        GetPage(
          name: '/feed',
          page: () => FeedPage(),
        ),
        GetPage(
          name: '/newPost',
          page: () => const NewPostPage(),
        ),
        GetPage(
          name: '/groupHome',
          page: () => GroupHomePage(),
        ),
        GetPage(
          name: '/newGroup',
          page: () => NewGroupPage(),
        ),
        GetPage(
          name: '/newGroupIcon',
          page: () => NewGroupIconPage(),
        ),
        GetPage(
          name: '/groupChat',
          page: () => GroupChatPage(),
        ),
        GetPage(
          name: '/editGroup',
          page: () => EditGroupPage(),
        ),
        GetPage(
          name: '/editGroupName',
          page: () => EditGroupNamePage(),
        ),
        GetPage(
          name: '/editGroupIcon',
          page: () => EditGroupIconPage(),
        ),
        GetPage(
          name: '/editGroupMember',
          page: () => EditGroupMemberPage(),
        ),
        GetPage(
          name: '/deleteGroup',
          page: () => DeleteGroupPage(),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
        ),
        GetPage(
          name: '/settings',
          page: () => SettingsPage(),
        ),
        GetPage(
          name: '/editNameEmail',
          page: () => EditNameEmailPage(),
        ),
        GetPage(
          name: '/editProfileIcon',
          page: () => EditProfileIconPage(),
        ),
        GetPage(
          name: '/editPassword',
          page: () => EditPasswordPage(),
        ),
        GetPage(
          name: '/deleteProfile',
          page: () => DeleteProfilePage(),
        ),
        GetPage(
          name: '/teste',
          page: () => TestPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

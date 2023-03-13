import 'package:app/view/screens/login_page.dart';
import 'package:app/view/screens/register_page.dart';
import 'package:app/view/screens/feed_page.dart';
import 'package:app/view/screens/new_post_page.dart';
import 'package:app/view/screens/group_home_page.dart';
import 'package:app/view/screens/new_group_page.dart';
import 'package:app/view/screens/new_group_icon_page.dart';
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
          name: '/teste',
          page: () => TestPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

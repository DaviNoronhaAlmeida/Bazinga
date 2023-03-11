import 'package:app/view/screens/login_page.dart';
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
          name: '/teste',
          page: () => TestPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';

class ChooseIcon extends StatelessWidget {
  ChooseIcon({super.key});

  final AppColors _appColors = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              //Icon Box
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: _appColors.bgPostsColor,
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 16),
                        child: Wrap(
                          spacing: 40.0,
                          runSpacing: 40.0,
                          children: [
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon1.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon2.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon3.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon4.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon5.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon6.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon7.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon8.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon9.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon10.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon11.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon12.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon13.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon14.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon15.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon16.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon17.png')),
                            Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon18.png')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
                    color: _appColors.bgPostsColor.value,
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
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
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon1.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon2.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon3.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon4.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon5.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon6.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon7.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon8.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon9.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon10.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon11.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon12.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon13.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon14.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon15.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon16.png')),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/icon17.png')),
                            SizedBox(
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

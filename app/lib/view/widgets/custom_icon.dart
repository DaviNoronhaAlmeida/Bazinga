import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view-model/utils/icon.dart';
import '../styles/app_colors.dart';

class ChooseIcon extends StatelessWidget {
  ChooseIcon({super.key});

  final AppColors _appColors = Get.find();
  final IconController iconController = Get.put(IconController());

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
                          spacing: 10.0,
                          runSpacing: 40.0,
                          children: [
                            IconButton(
                              icon: Image.asset('assets/images/icon1.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon2.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon3.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon4.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon5.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon6.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon7.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon8.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon9.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon10.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon11.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon12.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon13.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon14.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon15.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon16.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon17.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/icon18.png'),
                              iconSize: 50,
                              onPressed: () {
                                // Modify icon controller here
                              },
                            ),
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

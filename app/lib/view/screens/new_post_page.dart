import 'package:app/view/widgets/custom_big_input.dart';
import 'package:app/view/widgets/custom_appbar.dart';
import 'package:app/view/widgets/custom_navbar.dart';
import 'package:app/view/widgets/custom_big_button.dart';
import '../../view-model/services/new_post_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../styles/app_colors.dart';
import '../../view-model/utils/token.dart';
import 'package:app/view-model/controllers/feed_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import '../../model/feed_functions/upload_img.dart';
import 'dart:io';

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  File? _image;
  final TextEditingController _postController = TextEditingController();
  dynamic sendToken = "";
  final FeedController _feedController = Get.put(FeedController());
  String imagePath = '';

  Future<File> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);

        imagePath = pickedFile.path.toString();
      });
      return File(pickedFile.path);
    } else {
      imagePath = '';
      return File(imagePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    String serverPath;
    return GetBuilder<AppColors>(
      init: AppColors(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: CustomAppBar(),
            resizeToAvoidBottomInset: false,
            backgroundColor: _.backgroundColor.value,
            body: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 50),
                child: Column(
                  children: [
                    //INPUT
                    CustomBigInput(
                      inputTittle: 'Nova Publicação:',
                      controller: _postController,
                    ),
                    const Spacer(),
                    if (_image != null)
                      SizedBox(
                        height: 130,
                        child: Image.file(_image!),
                      ),
                    const Spacer(),

                    //UPLOAD IMAGEM
                    ElevatedButton(
                      onPressed: _getImage,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          _.redColor.value,
                        ),
                      ),
                      child: const Text('ADICIONAR IMAGEM'),
                    ),

                    //BOTÃO
                    GetBuilder<Token>(
                      builder: (token) => CustomBigButton(
                        tittleBtn: 'PUBLICAR',
                        customMargin: 15,
                        function: () async {
                          sendToken = Get.find<Token>().token;
                          if (imagePath != '') {
                            final serverPath = await uploadImg(imagePath);
                            newPost(_postController.text.trim(), sendToken,
                                serverPath['content']['url']);
                          } else {
                            serverPath = '';
                            newPost(_postController.text.trim(), sendToken,
                                serverPath);
                          }
                          ;
                          Get.find<FeedController>()
                              .refreshController
                              .requestRefresh();
                          Get.toNamed('/feed');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomNavBar(),
          ),
        );
      },
    );
  }
}

import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecno_blog/components/snackbars.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/consts/storage.dart';
import 'package:tecno_blog/core/controller/small_controllers/page_handler_controller.dart';
import 'package:tecno_blog/page_handler.dart';
import 'package:tecno_blog/core/routes/app_pages.dart';
import 'package:tecno_blog/services/dio_service.dart';

class RegisterController extends GetxController {


  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activationCodeEditingController = TextEditingController();

  var email = '';
  var userId = '';

  Future<dynamic> register() async {
    
    Map<String, dynamic> map = {
      'email' : emailTextEditingController.text,
      'command' : 'register',
    };

    var response = await DioService().postMethod(ApiUrl.postMethodRegister, map);

    email = emailTextEditingController.text;
    userId = response!.data['user_id'];

    if (kDebugMode) {
      print(response.data);
    }

  }

  Future<dynamic> verify() async {

    Map<String, dynamic> map = {
      'email' : email,
      'user_id' : userId,
      'code' : activationCodeEditingController.text,
      'command' : 'verify',
    };

    var response = await DioService().postMethod(ApiUrl.postMethodRegister, map);

    if (kDebugMode) {
      print(response!.data);
    }

    if (response!.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(
        AppStorage.token, response.data['token']
      );
      box.write(
        AppStorage.userId, response.data['user_id']
      );

      Get.find<PageHandlerController>().selectedPageIndex.value = 0;
      Get.offAll(PageHandler());
    } else {
      AppSnackBars.failed('ثبت نام تایید نشد');
      log('Error on registeration');
    }
  }

  void checkIfUserIsLogin(){

    if (GetStorage().read(AppStorage.token) == null) {
      Get.toNamed(AppRoutes.registerIntroPage);
    } else {
      Get.find<PageHandlerController>().selectedPageIndex.value = 1;
      Get.toNamed(AppRoutes.pageHandler);
    }

  }

}
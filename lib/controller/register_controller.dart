import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
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

    var response = await DioService().postMethod(map, ApiUrl.postMethodRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];

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

    var response = await DioService().postMethod(map, ApiUrl.postMethodRegister);

    if (kDebugMode) {
      print(response.data);
    }

  }

}
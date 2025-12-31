import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/core/controller/article/article_management_controller.dart';

void getTitleDialog(ArticleManagementController controller) {

  Get.defaultDialog(
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    titlePadding: const EdgeInsets.symmetric(vertical: 20),
    title: 'عنوان مقاله',
    titleStyle: const TextStyle(
      color: AppSolidColors.primary
    ),
    content: TextField(
      keyboardType: .text,
      controller: controller.titleTextEditingController,
      decoration: InputDecoration(
        hintText: 'عنوان را وارد کنید',
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey
          ),
        ),
      ),
    ),
    confirm: ElevatedButton(
      onPressed: () {
        controller.updateTitle();
        Get.back();
      },
      child: Text('ثبت و ذخیره', style: TextStyle(color: Colors.white))
    )
  );

}
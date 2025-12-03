import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/small_controllers/page_handler_controller.dart';
import 'package:tecno_blog/consts/app_styles.dart';

class GoToWriteArticlePage extends StatelessWidget {
  const GoToWriteArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(                
      style: AppStyles.textButtonGlassStyle,

      onPressed: () {
        final index = Get.find<PageHandlerController>().selectedPageIndex;
        index.value = 0;
      },

      // Text Button C0ntent
      child: Row(
        spacing: 6,
        children: [
          Text(
            AppStrings.goToArticleWritePageText,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppSolidColors.accent,
            ),
          ),
          Icon(
            CupertinoIcons.arrow_left,
            size: 16,
            color: AppSolidColors.accent,
          ),
        ],
      )
    );
  }
}
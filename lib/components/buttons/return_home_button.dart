import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/page_handler_controller.dart';
import 'package:tecno_blog/consts/app_styles.dart';

class ReturnHomeButton extends StatelessWidget {
  const ReturnHomeButton({super.key});

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
            AppStrings.bacToHomekButtonText,
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
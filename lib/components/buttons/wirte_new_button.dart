import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/routes/app_pages.dart';
import 'package:tecno_blog/styles/app_styles.dart';

class GoToWriteArticlePage extends StatelessWidget {
  const GoToWriteArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(                
      style: AppStyles.textButtonGlassStyle,

      onPressed: () {
        routeToWriteBottomSheet();
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
            CupertinoIcons.book_solid,
            size: 16,
            color: AppSolidColors.accent,
          ),
        ],
      )
    );
  }

  dynamic routeToWriteBottomSheet(){

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        height: Get.height / 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: .center,
              children: [
                SvgPicture.asset(
                  AppAssets.tecnoBotSmile,
                  alignment: .center,
                  width: 40,
                  height: 40,
                ),

                const SizedBox(width: 10),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    AppStrings.bottomSheetSharePostTitle,
                  ),
                )
              ],
            ),

            const SizedBox(height: 24),

            Text(
              'فکر کن اینجا بودنت به این معناست که یک گیک تکنولوژی هستی. پس دانسته هات رو با ما در میون بذار عزیزم!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Colors.black.withValues(alpha: .5)
              ),
            ),

            const SizedBox(height: 34),

            Row(
              spacing: 16,
              children: [
                BottomSheetButton(
                  bgcolor: AppSolidColors.accent,
                  text: 'مدیریت مقاله',
                  textColor: Colors.white,
                  function: () {
                    Get.back();
                    Get.toNamed(AppRoutes.articleListManagement);
                  },
                ),

                BottomSheetButton(
                  bgcolor: AppSolidColors.accent.withValues(alpha: .2),
                  text: 'مدیریت پادکست',
                  textColor: AppSolidColors.accent,
                  function: () {
                    
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}

class BottomSheetButton extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final Color textColor;
  final Function() function;
  const BottomSheetButton({
    super.key, required this.bgcolor, required this.text, required this.textColor, required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: .circular(12)
          ),
          width: Get.width / 2,
          height: 60,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: .w400
              ),
            ),
          ),
        ),
      ),
    );
  }
}
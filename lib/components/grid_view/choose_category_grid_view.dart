import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/core/controller/article/article_management_controller.dart';
import 'package:tecno_blog/core/controller/home_controller.dart';

class ChooseCategoryForArticleGridView extends StatelessWidget {
  const ChooseCategoryForArticleGridView({
    super.key,
    required this.homeScreenController,
    required this.articleManagementController,
  });

  final HomeController homeScreenController;
  final ArticleManagementController articleManagementController;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemCount: homeScreenController.tagsList.length,
      itemBuilder: (context, index) {
    
        final tag = homeScreenController.tagsList[index];
    
        return GestureDetector(
          onTap: () {
            articleManagementController.articleInfoModel.update((val) {
              val!.catId = tag.id!;
            });

            articleManagementController.articleInfoModel.update((val) {
              val!.catName = tag.title!;
            });

            Get.back();
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            margin: index == homeScreenController.tagsList.length - 1
              ? .zero
              : const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppGradientColors.tags,
                end: AlignmentGeometry.topLeft,
                begin: AlignmentGeometry.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Text(
                tag.title!,
                style: textTheme.labelSmall!.copyWith(
                  height: 1.7
                ),
                textAlign: .center,
              ),
            ),
          ),
        );
    
      },
    );
  }
}
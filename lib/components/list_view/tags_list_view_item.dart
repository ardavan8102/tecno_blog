import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/core/controller/article/list_article_controller.dart';
import 'package:tecno_blog/core/controller/small_controllers/page_handler_controller.dart';
import 'package:tecno_blog/core/models/tags_model.dart';
import 'package:tecno_blog/core/routes/app_pages.dart';

class TagsListViewItem extends StatelessWidget {
  const TagsListViewItem({
    super.key,
    required this.articleController,
    required this.articleTag,
    required this.index,
  });

  final ListArticleController articleController;
  final RxList<TagsModel> articleTag;
  final int index;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    
    return GestureDetector(
      onTap: () async {
        var tagId = articleTag[index].id ?? "";

        articleController.articlesList.clear(); 
        await articleController.getArticleListByTagId(tagId);

        // TODO : Crash on opening tag's article
        Get.find<PageHandlerController>().selectedPageIndex = 1.obs;
        Get.toNamed(AppRoutes.pageHandler);
      },
      child: Container(
        padding: EdgeInsets.only(right: 12, left: 12),
        height: 70,
        decoration: BoxDecoration(
          color: AppSolidColors.accent.withValues(alpha: 0.1),
          borderRadius: .circular(10)
        ),
        child: Row(
          spacing: 10,
          children: [
            Image.asset(
              AppAssets.hashtagIcon,
              width: 24,
              height: 24,
              color: AppSolidColors.accent,
            ),
            Text(
              articleTag[index].title ?? "بدون دسته بندی",
              style: textTheme.bodySmall!.copyWith(
                color: AppSolidColors.accent,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
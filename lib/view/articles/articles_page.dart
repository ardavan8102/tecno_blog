import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/buttons/return_home_button.dart';
import 'package:tecno_blog/components/loading_cube.dart';
import 'package:tecno_blog/consts/app_styles.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/article_single_page_controller.dart';
import 'package:tecno_blog/controller/list_article_controller.dart';
import 'package:tecno_blog/models/article_model.dart';
import 'package:tecno_blog/view/articles/article_single_page.dart';

// ignore: must_be_immutable
class ArticlesPage extends StatelessWidget {
  ArticlesPage({super.key});

  ListArticleController articleListController = Get.put(ListArticleController());
  ArticleSinglePageController articleSinglePageController = Get.put(ArticleSinglePageController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: .center,
          children: [
            // Custom Top Bar
            customAppBarArticlesPage(size, textTheme),
          
            const SizedBox(height: 16),

            const SizedBox(height: 16),

            // Articles List
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              height: size.height / 1.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppGradientColors.articlesListBackground,
                  begin: .topCenter,
                  end: .bottomCenter,
                ),
                borderRadius: .circular(18),
              ),
              child: Obx(
                () => articleListController.loading.value == false 
                  ? ListView.builder(
                    itemCount: articleListController.articlesList.length,
                    scrollDirection: .vertical,
                    itemBuilder: (context, index) {
                      final post = articleListController.articlesList[index];
                  
                      return articleListPostItem(size, post, textTheme, index);
                    },
                  )
                  : LoadingCube(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Post Item
  Padding articleListPostItem(Size size, ArticleModel post, TextTheme textTheme, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        height: size.height / 6,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: .circular(12),
        ),
        child: Row(
          children: [
            // Post Image
            postItemCardThumbnail(post, size),

            // Post Details
            postItemCardDetails(post, textTheme, index),
          ],
        ),
      ),
    );
  }

  // Post Item Details
  Expanded postItemCardDetails(ArticleModel post, TextTheme textTheme, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          children: [
            // Title
            Text(
              post.title!,
              maxLines: 2,
              overflow: .ellipsis,
              style: AppStyles.articlePostListTitle,
            ),

            // Date & Button
            Expanded(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
              
                  Row(
                    spacing: 6,
                    children: [
                      Icon(
                        CupertinoIcons.calendar,
                        size: 20,
                        color: AppSolidColors.accent,
                      ),
                      Text(
                        post.createdAt ?? "مدتی پیش",
                        style: textTheme.bodySmall,
                      )
                    ],
                  ),
              
                  IconButton(
                    style: AppStyles.iconButtonGlassStyle,
                    onPressed: () {
                      Get.to(
                        () => ArticleSinglePage(),
                        arguments: int.parse(articleListController.articlesList[index].id!)
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.right_chevron,
                      size: 18,
                      color: AppSolidColors.primary,
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Post Item Image
  CachedNetworkImage postItemCardThumbnail(ArticleModel post, Size size) {
    return CachedNetworkImage(
      imageUrl: post.image ?? "",
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 100,
          height: size.height / 6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          )
        );
      },
      placeholder: (context, url) {
        return LoadingCube();
      },
      errorWidget: (context, url, error) {
        return Container(
          padding: const EdgeInsets.only(top: 8, left: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppGradientColors.tags,
              begin: .bottomRight,
              end: .topLeft,
            ),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Align(
            alignment: .topLeft,
            child: Icon(
              Icons.image_not_supported_outlined,
              color: Colors.white,
              size: 50
            ),
          ),
        );
      },
    );
  }

  // Custom App Bar
  Container customAppBarArticlesPage(Size size, TextTheme textTheme) {
    return Container(
      width: double.maxFinite,
      height: size.height / 15,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: .circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 12),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,
          children: [
            // Title
            Text(
              AppStrings.appBarTitleText,
              style: textTheme.bodyLarge,
            ),

            // Button
            ReturnHomeButton(),
          ],
        ),
      ),
    );
  }
}
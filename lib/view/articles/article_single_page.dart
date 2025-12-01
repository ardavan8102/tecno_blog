import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/section/single_article_appbar.dart';
import 'package:tecno_blog/consts/app_styles.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/article_controller.dart';
import 'package:tecno_blog/controller/small_controllers/bookmarked_controller.dart';
import 'package:tecno_blog/models/article_model.dart';

class ArticleSinglePage extends StatelessWidget {
  final int articleIndex;
  
  ArticleSinglePage({super.key, required this.articleIndex});

  final ArticleController articleController = Get.find<ArticleController>();
  final BookmarkedController bookmarkedController = Get.put(BookmarkedController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var articleItem = articleController.articlesList[articleIndex];

    // Colorizing First 2 words of title
    final articleTitle = articleItem.title ?? "";
    final words = articleTitle.split(' ');
    final firstTwoWordsOfTitle = words.take(2).join(' ');
    final restOfTitleWords = words.skip(2).join(' ');

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: Column(
        children: [
          // Image Section
          Stack(
            children: [
              // Image
              Container(
                width: double.infinity,
                height: size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(articleController.articlesList[articleIndex].image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradientColors.articleImageSinglePlage,
                    begin: .bottomCenter,
                    end: .topCenter,
                  ),
                ),
              ),

              // App Bar
              SingleArticleAppbar(bookmarkedController: bookmarkedController),
            ],
          ),

          // Article Content
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(20, 30, 20, 80),
                // Main Column
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
              
                    // Title
                    dualColorTitle(firstTwoWordsOfTitle, restOfTitleWords),
              
                    const SizedBox(height: 24),
              
                    // Author & Date
                    authorAndDateSection(articleItem, textTheme),
              
                    const SizedBox(height: 24),
              
                    // Content : Title
                    Text(
                      AppStrings.articleContentSectionTitle,
                      style: textTheme.titleLarge,
                    ),

                    const SizedBox(height: 10),
              
                    // Content
                    Text(
                      AppStrings.loremTestText,
                      style: textTheme.bodySmall,
                    ),

                    const SizedBox(height: 20),

                    // Category
                    articleCategoryContainer(articleItem, textTheme),

                    // List View : related Posts

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Category Container
  Container articleCategoryContainer(ArticleModel articleItem, TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.only(right: 12, left: 12),
      height: 70,
      width: double.infinity,
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
            articleItem.catName ?? "بدون دسته بندی",
            style: textTheme.bodySmall!.copyWith(
              color: AppSolidColors.accent,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  // Author and Date
  Row authorAndDateSection(ArticleModel articleItem, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            // Profile Image
            Image.asset(
              AppAssets.defaultProfilePicture,
              height: 32,
              width: 32,
            ),

            // Author Name
            Text(
              articleItem.author ?? "کاربر عادی",
              style: textTheme.bodySmall,
            ),
          ],
        ),

        // Date
        Text(
          articleItem.createdAt != null ? 'انتشار در ${articleItem.createdAt}' : "مدتی پیش",
          style: textTheme.bodySmall!.copyWith(
            color: AppSolidColors.text,
          ),
        ),
      ],
    );
  }

  // Title : Dual Color
  RichText dualColorTitle(String firstTwoWordsOfTitle, String restOfTitleWords) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$firstTwoWordsOfTitle ',
            style: AppStyles.articleSinglePageTitleText.copyWith(
              color: AppSolidColors.primary,
            ),
          ),

          TextSpan(
            text: restOfTitleWords,
            style: AppStyles.articleSinglePageTitleText.copyWith(
              color: AppSolidColors.titleText,
            ),
          ),
        ]
      )
    );
  }
}
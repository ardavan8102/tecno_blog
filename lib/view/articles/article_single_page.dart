import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/loading_cube.dart';
import 'package:tecno_blog/components/section/single_article_appbar.dart';
import 'package:tecno_blog/consts/app_styles.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/article_single_page_controller.dart';
import 'package:tecno_blog/controller/list_article_controller.dart';
import 'package:tecno_blog/controller/small_controllers/bookmarked_controller.dart';
import 'package:tecno_blog/models/article_info.dart';

class ArticleSinglePage extends StatefulWidget {
  const ArticleSinglePage({super.key});

  @override
  State<ArticleSinglePage> createState() => _ArticleSinglePageState();
}

class _ArticleSinglePageState extends State<ArticleSinglePage> {

  // Controllers
  ListArticleController articleController = Get.find<ListArticleController>();

  BookmarkedController bookmarkedController = Get.put(BookmarkedController());

  ArticleSinglePageController articleSinglePageController = Get.find<ArticleSinglePageController>();

  @override
  void initState() {
    super.initState();
    articleSinglePageController.articleInfoModel.value = ArticleInfo();
    articleSinglePageController.getArticleInformation();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var articleItem = articleSinglePageController.articleInfoModel;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: Obx(
        () => articleSinglePageController.loading.value == false
        ? Column(
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
                      image: NetworkImage(articleSinglePageController.articleInfoModel.value.image ?? ""),
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
                      dualColorTitle(articleItem.value),
                
                      const SizedBox(height: 24),
                
                      // Author & Date
                      authorAndDateSection(articleItem.value, textTheme),
                
                      const SizedBox(height: 24),
                
                      // Content : Title
                      Text(
                        AppStrings.articleContentSectionTitle,
                        style: textTheme.titleLarge,
                      ),
        
                      const SizedBox(height: 10),
                
                      // Content
                      HtmlWidget(
                        articleItem.value.content ?? "",
                        textStyle: textTheme.bodySmall,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) => Center(child: LoadingCube()),
                      ),
        
                      const SizedBox(height: 20),
        
                      // Category
                      articleCategoryContainer(articleItem.value, textTheme),
        
                      // List View : related Posts
        
                    ],
                  ),
                ),
              ),
            ),
          ],
        ) : const Center(child: LoadingCube()),
      ),
    );
  }

  // Category Container
  Container articleCategoryContainer(ArticleInfo articleItem, TextTheme textTheme) {
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
  Row authorAndDateSection(ArticleInfo articleItem, TextTheme textTheme) {
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
  RichText dualColorTitle(ArticleInfo item) {

    final articleTitle = item.title ?? "";
    final words = articleTitle.split(' ');
    final firstTwoWordsOfTitle = words.take(2).join(' ');
    final restOfTitleWords = words.skip(2).join(' ');

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
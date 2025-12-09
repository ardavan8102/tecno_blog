import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/html_text_widget.dart';
import 'package:tecno_blog/components/loading_cube.dart';
import 'package:tecno_blog/components/section/single_article_appbar.dart';
import 'package:tecno_blog/routes/app_pages.dart';
import 'package:tecno_blog/styles/app_styles.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/article_single_page_controller.dart';
import 'package:tecno_blog/controller/list_article_controller.dart';
import 'package:tecno_blog/controller/small_controllers/bookmarked_controller.dart';
import 'package:tecno_blog/controller/small_controllers/page_handler_controller.dart';
import 'package:tecno_blog/models/article_info.dart';
import 'package:tecno_blog/models/article_model.dart';
import 'package:tecno_blog/models/tags_model.dart';

class ArticleSinglePage extends StatefulWidget {
  const ArticleSinglePage({super.key});

  @override
  State<ArticleSinglePage> createState() => _ArticleSinglePageState();
}

class _ArticleSinglePageState extends State<ArticleSinglePage> {

  // Controllers
  ListArticleController articleController = Get.find<ListArticleController>();
  BookmarkedController bookmarkedController = Get.find<BookmarkedController>();
  ArticleSinglePageController articleSinglePageController = Get.find<ArticleSinglePageController>();


  @override
  void initState() {
    super.initState();

    final id = Get.arguments as int;

    articleSinglePageController.id.value = id;

    articleSinglePageController.relatedArticlesList.clear();
    articleSinglePageController.articleTagsList.clear();

    articleSinglePageController.getArticleInformation();

  }

  @override
  Widget build(BuildContext context) {

    // Variables
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    // Item Data & Lists
    var articleItem = articleSinglePageController.articleInfoModel;
    var relatedList = articleSinglePageController.relatedArticlesList;
    var articleTagsList = articleSinglePageController.articleTagsList;

    // Post Items
    var postThumbnailHeight = size.height / 6;
    var postThumbnailWidth = size.width / 2.2;

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
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsetsGeometry.fromLTRB(20, 30, 20, 50),
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
                      HtmlTextWidget(
                        text: articleItem.value.content ?? ""
                      ),
        
                      const SizedBox(height: 40),
        
                      // Category
                      articleTagsListView(articleTagsList, textTheme),
        
                      const SizedBox(height: 40),

                      // List View Title
                      Text(
                        AppStrings.relatedPostsTitle,
                        style: textTheme.titleLarge,
                      ),

                      const SizedBox(height: 10),
                      
                      // List View Related Posts
                      SizedBox(
                        height: size.height / 3.5,
                        width: double.infinity,
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: .horizontal,
                            itemCount: relatedList.length,
                            itemBuilder: (context, index) {
                              final relatedItem = relatedList[index];
                              return Padding(
                                padding: index == (relatedList.length - 1)
                                ? EdgeInsetsGeometry.fromLTRB(
                                    0,
                                    8,
                                    8,
                                    8,
                                  )
                                : index == 0 
                                ? EdgeInsetsGeometry.fromLTRB(
                                    8,
                                    8,
                                    0,
                                    8,
                                  )
                                : const EdgeInsets.all(10),
                                child: relatedPostListItem(
                                  size,
                                  relatedItem,
                                  textTheme,
                                  postThumbnailHeight,
                                  postThumbnailWidth
                                ),
                              );
                            } ,
                          ),
                        ),
                      ),
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

  // Tags List View
  Widget articleTagsListView(RxList<TagsModel> articleItem, TextTheme textTheme) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          scrollDirection: .horizontal,
          itemCount: articleItem.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: articleItem.length -1 == index 
              ? const EdgeInsets.only(right: 8)
              : index == 0 
              ? const EdgeInsets.only(left: 8)
              : const EdgeInsets.only(right: 8, left: 8),
              child: tagListViewItem(articleItem, index, textTheme),
            );
          }
        ),
      ),
    );
  }

  // Tag List View Item
  Widget tagListViewItem(RxList<TagsModel> articleTag, int index, TextTheme textTheme) {
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

  // Related Post Item
  Column relatedPostListItem(
    Size size,
    ArticleModel item,
    TextTheme textTheme,
    var height,
    var width,
  ) {
    return Column(
      spacing: 10,
      children: [
        // Image Box
        SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              // Image
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradientColors.postOverlay,
                    begin: .topCenter,
                    end: .bottomCenter,
                  ),
                  borderRadius: .circular(16)
                ),
                child: CachedNetworkImage(
                  imageUrl: item.image ?? "",
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      )
                    );
                  },
                  placeholder: (context, url) => LoadingCube(),
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
                ),
              ),

              // Meta Tags
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: .spaceAround,
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      item.author == null 
                      ? 'کاربر عادی'
                      : item.author == ""
                      ? 'بدون نام'
                      : item.author!,
                      style: textTheme.labelSmall
                    ),

                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          item.view!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Icon(
                          CupertinoIcons.eye_fill,
                          size: 16,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Title
        SizedBox(
          width: size.width / 2.2,
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            item.title!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

}
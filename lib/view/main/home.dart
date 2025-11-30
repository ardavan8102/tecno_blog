import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/view_builder_items/category_item.dart';
import 'package:tecno_blog/components/section_title.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/home_controller.dart';
import 'package:tecno_blog/models/fake_data.dart';
import 'package:tecno_blog/models/home_page_models/article_model.dart';
import 'package:tecno_blog/models/home_page_models/podcast_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    // Variables
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var mainBodyMargin = size.width / 12;
    var postThumbnailHeight = size.height / 6;
    var postThumbnailWidth = size.width / 2.2;

    // Main Widget
    return Stack(
      children: [
        // Content
        homeScreen(
          size,
          textTheme,
          mainBodyMargin,
          postThumbnailHeight,
          postThumbnailWidth,
        ),
      ],
    );
  }

  // Home Screen Data
  SingleChildScrollView homeScreen(
    Size size,
    TextTheme textTheme,
    double mainBodyMargin,
    double postThumbnailHeight,
    double postThumbnailWidth,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .center,
        children: [
          // Banner
          bigBannerSection(size, textTheme),
      
          const SizedBox(height: 24),
      
          // Tags
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: tagList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = tagList[index];
                return Padding(
                  padding:
                      index ==
                          0 // if it was first item :
                      ? EdgeInsets.fromLTRB(8, 8, mainBodyMargin, 8)
                      : index ==
                            (tagList.length - 1) // If it was last item :
                      ? EdgeInsets.fromLTRB(mainBodyMargin, 8, 8, 8)
                      // Otherwise :
                      : EdgeInsets.all(8),
                  child: CategoryTagListItem(
                    hashTagItem: item,
                    index: index
                  ),
                );
              },
            ),
          ),
      
          // Hot Articles
          Padding(
            padding: EdgeInsets.only(
              right: mainBodyMargin,
              top: 32,
              bottom: 8,
            ),
            child: Column(
              spacing: 16,
              children: [
                // Section Title
                CustomSectionTitle(
                  text: AppStrings.hotArticles,
                  assetName: AppAssets.penIcon,
                ),

                // Top visited blog List
                topVisited(size, mainBodyMargin, textTheme, postThumbnailHeight, postThumbnailWidth),
              ],
            ),
          ),
      
          // Hot Podcasts
          Column(
            children: [
              // Section Title
              Padding(
                padding: EdgeInsets.only(
                  right: mainBodyMargin,
                  top: 8,
                  bottom: 8,
                ),
                child: CustomSectionTitle(
                  text: AppStrings.hotPodcastes,
                  assetName: AppAssets.microphoneIcon,
                ),
              ),
                
              // Podcast List View
              topPodcasts(size, mainBodyMargin, textTheme, postThumbnailHeight, postThumbnailWidth),
            
              SizedBox(
                height: 32,
              ),
            
            ],
          ),
      
          //
        ],
      ),
    );
  }

  // Podcast List View
  Widget topPodcasts(Size size, double mainBodyMargin, TextTheme textTheme, var postThumbnailHeight, postThumbnailWidth){
    return SizedBox(
      height: size.height / 3.5,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: homeController.topPodcastsList.length,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            final item = homeController.topPodcastsList[index];
            return Padding(
              padding:
                index == 0 // if it was first item :
                ? EdgeInsets.fromLTRB(8, 8, mainBodyMargin, 8)
                : index == (homeController.topPodcastsList.length - 1) // If it was last item :
                ? EdgeInsets.fromLTRB(mainBodyMargin, 8, 8, 8)
                // Otherwise :
                : EdgeInsets.all(8),
              child: podCastItem(
                postThumbnailHeight,
                postThumbnailWidth,
                item,
                textTheme,
              ),
            );
          },
        ),
      ),
    );
  }

  // Posts List View
  Widget topVisited(Size size, double mainBodyMargin, TextTheme textTheme, var postThumbnailHeight, postThumbnailWidth){
    return
      SizedBox(
        height: size.height / 3.5,
        width: double.infinity,
        child: Obx(
          () => ListView.builder(
            itemCount: homeController.topVisitedList.length,
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              final item = homeController.topVisitedList[index];
          
              // Hot Blog Item
              return Padding(
                padding: index == (homeController.topVisitedList.length - 1)
                    ? EdgeInsetsGeometry.fromLTRB(
                        mainBodyMargin,
                        8,
                        8,
                        8,
                      )
                    : const EdgeInsets.all(10),
                child: hotBlogPostsItem(
                  size,
                  item,
                  textTheme,
                  postThumbnailHeight,
                  postThumbnailWidth,
                ),
              );
            },
          ),
        ),
      );
  }

  // Podcast's Item
  Column podCastItem(
    double postThumbnailHeight,
    double postThumbnailWidth,
    PodcastModel item,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        // Image & Meta Tags
        SizedBox(
          height: postThumbnailHeight,
          width: postThumbnailWidth,
          child: Stack(
            children: [
              // Image
              CachedNetworkImage(
                imageUrl: item.poster ?? "",
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
                placeholder: (context, url) {
                  return const SpinKitFadingCube(
                    color: AppSolidColors.primary,
                    size: 32,
                  );
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
              ),

              // Meta Tags
              Positioned(
                bottom: 12,
                left: 0,
                right: 12,
                child: podCastMetaTags(item, textTheme),
              ),
            ],
          ),
        ),

        // Title
        SizedBox(
          width: postThumbnailWidth,
          child: Text(
            item.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  // Podcast Meta Tags
  Column podCastMetaTags(PodcastModel item, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          spacing: 6,
          children: [
            Icon(
              CupertinoIcons.headphones,
              color: Colors.white.withValues(alpha: 0.7),
              size: 16,
            ),
            Text('پخش : ${item.view}', style: textTheme.labelSmall),
          ],
        ),
        Row(
          spacing: 6,
          children: [
            Icon(
              CupertinoIcons.mic_fill,
              color: Colors.white.withValues(alpha: 0.7),
              size: 16,
            ),
            Text(
              item.author == null ? 'کاربر عادی' : item.author!,
              style: textTheme.labelMedium
            ),
          ],
        ),
      ],
    );
  }

  // Big Banner Section
  Stack bigBannerSection(Size size, TextTheme textTheme) {
    return Stack(
      alignment: .topCenter,
      children: [
        // Banner Image
        Center(
          child: Container(
            width: size.width / 1.2,
            height: size.height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(homePageBannerMap['imageAsset']),
                fit: BoxFit.cover,
              ),
            ),
            // Overlay
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: AppGradientColors.thumbnailOverlay,
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
          ),
        ),

        // Banner Data
        Positioned(
          bottom: 20,
          left: size.width / 8,
          right: size.width / 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    '${homePageBannerMap['writer']} | ${homePageBannerMap['date']}',
                    style: textTheme.labelSmall,
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Text(
                        homePageBannerMap['view'],
                        style: textTheme.labelSmall,
                      ),
                      Icon(
                        CupertinoIcons.eye_fill,
                        size: 18,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ],
              ),
              Text(homePageBannerMap['title'], style: textTheme.labelLarge),
            ],
          ),
        ),
      ],
    );
  }

  // Hot Blog Post's Item
  Column hotBlogPostsItem(
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
              CachedNetworkImage(
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
                placeholder: (context, url) {
                  return const SpinKitFadingCube(
                    color: AppSolidColors.primary,
                    size: 32,
                  );
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
                      item.author == null ? 'کاربر عادی' : item.author!,
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

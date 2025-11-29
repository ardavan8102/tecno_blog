import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/components/view_builder_items/category_item.dart';
import 'package:tecno_blog/components/section_title.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/models/data_models.dart';
import 'package:tecno_blog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      
                // Posts List View
                SizedBox(
                  height: size.height / 3.5,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: blogList.getRange(0, 5).length,
                    scrollDirection: .horizontal,
                    itemBuilder: (context, index) {
                      final item = blogList[index];
      
                      // Hot Blog Item
                      return Padding(
                        padding: index == (blogList.getRange(0, 5).length - 1)
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
              SizedBox(
                height: size.height / 3.5,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: podCastList.length,
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    final item = podCastList[index];
                    return Padding(
                      padding:
                        index == 0 // if it was first item :
                        ? EdgeInsets.fromLTRB(8, 8, mainBodyMargin, 8)
                        : index == (podCastList.length - 1) // If it was last item :
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

  // Podcast's Item
  Column podCastItem(
    double postThumbnailHeight,
    double postThumbnailWidth,
    PodCastModel item,
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
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradientColors.postOverlay,
                    begin: .topCenter,
                    end: .bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
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
  Column podCastMetaTags(PodCastModel item, TextTheme textTheme) {
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
            Text('پخش : ${item.listens}', style: textTheme.labelSmall),
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
            Text('${item.podcaster}', style: textTheme.labelMedium),
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
    BlogModel item,
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
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradientColors.postOverlay,
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
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
                      item.writer!, 
                      style: textTheme.labelSmall
                    ),

                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          item.views!,
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

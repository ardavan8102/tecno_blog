import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/components/appbar.dart';
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

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var mainBodyMargin = size.width / 20;

    var postThumbnailHeight = size.height / 6;
    var postThumbnailWidth = size.width / 2.2;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              // Banner
              bigBannerSection(size, textTheme),
        
              const SizedBox(height: 16),
        
              // Tags
              SizedBox( 
                height: 60,
                child: ListView.builder(
                  itemCount: tagList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = tagList[index];
                    return Padding(
                      padding: index == 0 // if it was first item :
                        ? EdgeInsets.fromLTRB(8, 8, mainBodyMargin, 8)
                        : index == (tagList.length - 1) // If it was last item :
                          ? EdgeInsets.fromLTRB(mainBodyMargin, 8, 8, 8)
                          // Otherwise :
                          : EdgeInsets.all(8), 
                      child: hashtagMainContainer(item, textTheme),
                    );
                  },
                ),
              ),
        
              // Hot Articles
              Padding(
                padding: EdgeInsets.only(right: mainBodyMargin, top: 16, bottom: 8),
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
                              ? EdgeInsetsGeometry.fromLTRB(mainBodyMargin, 8, 8, 8)
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
        
              const SizedBox(height: 16),
        
              // Hot Podcasts
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, mainBodyMargin, 8),
                child: Column(
                  children: [
                    // Section Title
                    CustomSectionTitle(
                      text: AppStrings.hotPodcastes,
                      assetName: AppAssets.microphoneIcon,
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
                            padding: index == (blogList.length - 1)
                              ? EdgeInsetsGeometry.fromLTRB(mainBodyMargin, 8, 8, 8)
                              : const EdgeInsets.all(10),
                            child: podCastItem(postThumbnailHeight, postThumbnailWidth, item, textTheme),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            
              //
            ],
          ),
        ),
      ),
    );
  }

  // Podcast's Item
  Column podCastItem(double postThumbnailHeight, double postThumbnailWidth, PodCastModel item, TextTheme textTheme) {
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
                  ),borderRadius: BorderRadius.circular(16)
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
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
            Text(
              'تعداد پخش : ${item.listens}',
              style: textTheme.labelSmall,
            ),
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
              '${item.podcaster}',
              style: textTheme.labelLarge,
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
          left: 40,
          right: 40,
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
                  )
                ],
              ),
              Text(
                homePageBannerMap['title'],
                style: textTheme.labelLarge,
              )
            ],
          ),
        ),
      ],
    );
  }

  // Hot Blog Post's Item
  Column hotBlogPostsItem(Size size, BlogModel item, TextTheme textTheme, var height, var width) {
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
                  children: [
                    Text(
                      item.writer!,
                      style: textTheme.labelSmall,
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          item.views!,
                          style: textTheme.labelSmall,
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ),
      ],
    );
  }

  // Hashtags main box item
  Container hashtagMainContainer(HashTag item, TextTheme textTheme) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          colors: AppGradientColors.tags,
          begin: AlignmentGeometry.centerRight,
          end: AlignmentGeometry.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            ImageIcon(
              AssetImage(AppAssets.hashtagIcon),
              color: Colors.white,
              size: 16,
            ),
            Text(
              item.title!,
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
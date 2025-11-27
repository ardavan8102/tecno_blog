import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/components/appbar.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/models/data_models.dart';
import 'package:tecno_blog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var mainBodyMargin = size.width / 20;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            // Banner
            Stack(
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
            ),

            SizedBox(height: 16),

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

            //
          ],
        ),
      ),
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
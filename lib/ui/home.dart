import 'package:flutter/material.dart';
import 'package:tecno_blog/components/appbar.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

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
                        image: AssetImage(AppAssets.homeBannerBig),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Overlay
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: AppGradientColors.thumbnailOverlay,
                        begin: .topCenter,
                        end: .bottomCenter,
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
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'ملیکا عزیزی',
                            style: textTheme.labelSmall,
                          ),
                          Text(
                            'Like 254',
                            style: textTheme.labelSmall,
                          )
                        ],
                      ),
                      Text(
                        'اولین قدم در دنیای برنامه نویسی',
                        style: textTheme.labelLarge,
                      )
                    ],
                  ),
                ),

                //
              ],
            ),
          ],
        ),
      ),
    );
  }
}
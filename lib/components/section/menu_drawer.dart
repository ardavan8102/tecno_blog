import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';

class TecnoSideMenuDrawer extends StatelessWidget {
  const TecnoSideMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mainBodyMargin = size.width / 20;
    var textTheme = Theme.of(context).textTheme;

    return Drawer(
      backgroundColor: AppSolidColors.scaffoldBG,
      width: size.width - 100,
      child: ListView(
        children: [
          // Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border()
            ),
            padding: EdgeInsetsGeometry.only(left: 20),
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Image(
                  image: AssetImage(AppAssets.logo),
                  height: 70,
                  width: 70,
                ),
                Text(AppStrings.brandName),
              ],
            ),
            
          ),
          
          // Items
          Padding(
            padding: EdgeInsets.only(right : mainBodyMargin),
            child: Column(
              spacing: 30,
              children: [
                ListTile(
                  title: Text(
                    AppStrings.profilePage,
                    style: textTheme.bodyMedium,
                  ),
                  onTap: () {
                    
                  },
                ),

                ListTile(
                  title: Text(
                    AppStrings.aboutUsPage,
                    style: textTheme.bodyMedium,
                  ),
                  onTap: () {
                    
                  },
                ),

                ListTile(
                  title: Text(
                    AppStrings.shareTecnoApp,
                    style: textTheme.bodyMedium,
                  ),
                  onTap: () {
                    
                  },
                ),

                ListTile(
                  title: Text(
                    AppStrings.githubTecnoApp,
                    style: textTheme.bodyMedium,
                  ),
                  onTap: () {
                    
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

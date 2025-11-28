import 'package:flutter/material.dart';
import 'package:tecno_blog/components/light_divider.dart';
import 'package:tecno_blog/components/menu_item_inkwell.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    // Variables
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        // Profile Screen
        Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              
              SizedBox(height: 40),

              // profile image
              Image(
                image: AssetImage(AppAssets.defaultProfilePicture),
                width: 100,
                height: 100,
              ),

              const SizedBox(height: 10),
              
              // Edit picture
              editProfilePictureRow(),

              const SizedBox(height: 30),

              // Account Details
              accountNameAndEmail(textTheme),

              const SizedBox(height: 30),

              // Menu Items
              profileMenuItems(),

              // Distance from bottom
              SizedBox(height: size.height / 6),
            ],
          ),
        ),
      ],
    );
  }

  // Menu Items
  Column profileMenuItems() {
    return Column(
      spacing: 8,
      children: [

        CustomMenuItemWithInkWell(
          func: () {},
          splashColor: AppSolidColors.primary,
          menuText: AppStrings.myFavoriteBookmarks,
        ),

        LightGreyDivider(
          spaceFromStart: 100,
          spaceFromEnd: 100,
        ),

        CustomMenuItemWithInkWell(
          func: () {},
          splashColor: AppSolidColors.primary,
          menuText: AppStrings.myFavoritePodcasts,
        ),

        LightGreyDivider(
          spaceFromStart: 100,
          spaceFromEnd: 100,
        ),
        
        CustomMenuItemWithInkWell(
          func: () {},
          splashColor: AppSolidColors.secondary,
          menuText: AppStrings.logOutText,
        ),
      ],
    );
  }

  // Account Name & Email
  Column accountNameAndEmail(TextTheme textTheme) {
    return Column(
      spacing: 6,
      children: [
        Text(
          'اردوان اسکندری',
          style: textTheme.bodyMedium,
        ),
        Text(
          'ardavaneskandari007@gmail.com',
          style: textTheme.bodySmall,
        )
      ],
    );
  }

  // edit profile picture
  Row editProfilePictureRow() {
    return Row(
      spacing: 6,
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        ImageIcon(
          AssetImage(AppAssets.penIcon),
          color: AppSolidColors.sectionTitle,
          size: 18,
        ),
        Text(
          AppStrings.profileEdit,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppSolidColors.sectionTitle,
          ),
        ),
      ],
    );
  }
}
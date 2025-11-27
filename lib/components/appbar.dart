import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/consts/strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return AppBar(
      backgroundColor: AppSolidColors.scaffoldBG,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.bars),
            onPressed: () {},
          ),
          Row(
            children: [
              Image.asset(
                AppAssets.logo,
                height: size.height / 10,
              ),
              Text(
                AppStrings.brandName,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
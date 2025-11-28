import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';

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
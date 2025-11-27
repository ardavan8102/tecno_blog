import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';

class TecnoBottomNavigationBar extends StatelessWidget {
  final Size size;
  const TecnoBottomNavigationBar({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: size.height / 10,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppGradientColors.bottomNavigationWhiteOverlay,
          begin: .topCenter,
          end: .bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
        child: Container(
          height: size.height / 8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppGradientColors.bottomNavigationBackground,
              begin: .centerLeft,
              end: .centerRight,
            ),
            borderRadius: BorderRadius.circular(18)
          ),
          // Menu Items
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.house_fill,
                  color: Colors.white,
                  size: 32,
                ),
              ),
        
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(AppAssets.featherIcon),
                  color: Colors.white,
                  size: 32,
                ),
              ),
        
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
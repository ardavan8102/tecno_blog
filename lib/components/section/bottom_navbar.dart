import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/core/controller/register_controller.dart';

class TecnoBottomNavigationBar extends StatelessWidget {

  final Size size;
  final Function(int) changeScreen;

  TecnoBottomNavigationBar({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final RegisterController registerController = Get.find<RegisterController>();

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
            borderRadius: BorderRadius.circular(18),
          ),
          // Menu Items
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .spaceAround,
            children: [
              IconButton(
                onPressed: () => changeScreen(0),
                icon: Icon(
                  CupertinoIcons.house_fill,
                  color: Colors.white,
                  size: 32,
                ),
              ),

              IconButton(
                onPressed: () {
                  registerController.checkIfUserIsLogin();
                },
                icon: ImageIcon(
                  AssetImage(AppAssets.featherIcon),
                  color: Colors.white,
                  size: 32,
                ),
              ),

              IconButton(
                onPressed: () => changeScreen(3),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/section/appbar.dart';
import 'package:tecno_blog/components/section/bottom_navbar.dart';
import 'package:tecno_blog/components/section/menu_drawer.dart';
import 'package:tecno_blog/controller/page_handler_controller.dart';
import 'package:tecno_blog/view/main/home.dart';
import 'package:tecno_blog/view/profile/profile_screen.dart';
import 'package:tecno_blog/view/registration/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Global Key State for Drawer menu

class PageHandler extends StatelessWidget {

  PageHandler({super.key});

  final PageHandlerController controller = Get.put(PageHandlerController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // Bottom Navigation Screens
    List<Widget> tecnoMainPages = [

      HomeScreen(),

      RegisterIntroPage(),

      ProfileScreen(),

    ];

    return Scaffold(
      key: _key,
      appBar: CustomAppBar(stateKey: _key),
      drawer: TecnoSideMenuDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            // Screen
            Positioned.fill(
              child: Obx(() => IndexedStack(
                  index: controller.selectedPageIndex.value,
                  children: tecnoMainPages,
                ),
              ),
            ),
            
            // Bottom Navigaton Bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TecnoBottomNavigationBar(
                size: size,
                changeScreen: (int value) {
                  
                  controller.selectedPageIndex.value = value;

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
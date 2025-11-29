import 'package:flutter/material.dart';
import 'package:tecno_blog/components/section/appbar.dart';
import 'package:tecno_blog/components/section/bottom_navbar.dart';
import 'package:tecno_blog/components/section/menu_drawer.dart';
import 'package:tecno_blog/view/main/home.dart';
import 'package:tecno_blog/view/main/profile_screen.dart';
import 'package:tecno_blog/view/registration/register_intro.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey(); // Global Key State for Drawer menu

class _PageHandlerState extends State<PageHandler> {

  var selectedPageIndex = 0;

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
              child: IndexedStack(
                index: selectedPageIndex,
                children: tecnoMainPages,
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
                  
                  setState(() {
                    selectedPageIndex = value;
                  });

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
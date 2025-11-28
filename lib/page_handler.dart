import 'package:flutter/material.dart';
import 'package:tecno_blog/components/appbar.dart';
import 'package:tecno_blog/components/bottom_navbar.dart';
import 'package:tecno_blog/ui/home.dart';
import 'package:tecno_blog/ui/profile_screen.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({super.key});

  @override
  State<PageHandler> createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {

  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // Bottom Navigation Screens
    List<Widget> tecnoMainPages = [

      HomeScreen(),

      const Center(child: Text('Write New Article')),

      ProfileScreen(),
      
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            // Screen
            Center(
              child: Positioned.fill(
                child: tecnoMainPages[selectedPageIndex],
              )
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
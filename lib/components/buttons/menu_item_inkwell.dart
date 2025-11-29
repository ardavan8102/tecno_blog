import 'package:flutter/material.dart';

class CustomMenuItemWithInkWell extends StatelessWidget {
  final Function() func;
  final Color splashColor;
  final String menuText;
  
  const CustomMenuItemWithInkWell({
    super.key,
    required this.func,
    required this.splashColor,
    required this.menuText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      splashColor: splashColor,
      child: SizedBox(
        height: 45,
        child: Center(
          child: Text(
            menuText,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

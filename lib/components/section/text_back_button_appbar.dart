import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextAndBackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TextAndBackButtonAppBar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'مدیریت مقاله ها',
        style: textTheme.labelLarge!.copyWith(
          color: Colors.black
        ),
      ),
      actions: [
        
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            textDirection: .ltr,
          )
        ),
    
        const SizedBox(width: 20),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(60);
}
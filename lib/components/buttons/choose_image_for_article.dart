import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';

class ChooseImageForArticleButton extends StatelessWidget {
  const ChooseImageForArticleButton({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppSolidColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
          )
        ),
        child: Center(
          child: Text(
            'انتخاب تصویر',
            style: textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
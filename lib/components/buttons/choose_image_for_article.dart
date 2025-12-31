import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/services/pick_file.dart';

class ChooseImageForArticleButton extends StatelessWidget {
  const ChooseImageForArticleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    var textTheme = Theme.of(context).textTheme;
    
    return GestureDetector(
      onTap: () {
        pickImageFile();
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
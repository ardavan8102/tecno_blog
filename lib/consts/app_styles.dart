import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';

class AppStyles {

  static TextStyle articlePostListTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppSolidColors.titleText,
  );

  static ButtonStyle iconButtonGlassStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppSolidColors.primary.withValues(alpha: 0.15)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: .circular(8),
        side: BorderSide(
          width: 1,
          color: AppSolidColors.primary,
        )
      )
    ),
  );

  static ButtonStyle textButtonGlassStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppSolidColors.accent.withValues(alpha: 0.15)),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: .circular(10),
        side: BorderSide(
          width: 1,
          color: AppSolidColors.accent,
        )
      )
    ),
  );

}
import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';

class ElevatedContinueButton extends StatelessWidget {
  final String label;
  final Function() func;
  final Color bgColor;
  const ElevatedContinueButton({
    super.key,
    required this.label,
    required this.func,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: func,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(40, 14, 40, 14)),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return bgColor;
            }

            return bgColor.withValues(alpha: 0.7);
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
        ),
        textStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return textTheme.labelLarge;
            }

            return textTheme.labelSmall;
          },
        )
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppSolidColors.textLight
        ),
      ),
    );
  }
}

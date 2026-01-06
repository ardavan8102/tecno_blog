import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Function() func;
  
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: func,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(
        label,
        style: TextStyle(
          color: AppSolidColors.textLight
        ),
      ),
    );
  }
}

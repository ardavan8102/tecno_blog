import 'package:flutter/cupertino.dart';
import 'package:tecno_blog/consts/colors.dart';

class CustomSectionTitle extends StatelessWidget {
  final String text;
  final String assetName;
  const CustomSectionTitle({super.key, required this.text, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ImageIcon(
          AssetImage(assetName),
          color: AppSolidColors.sectionTitle,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppSolidColors.sectionTitle,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
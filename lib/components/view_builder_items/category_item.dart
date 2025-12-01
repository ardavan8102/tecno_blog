import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/models/tags_model.dart';

class CategoryTagListItem extends StatelessWidget {
  final TagsModel hashTagItem;
  final int index;

  const CategoryTagListItem({
    super.key,
    required this.hashTagItem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final item = hashTagItem;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          colors: AppGradientColors.tags,
          begin: AlignmentGeometry.centerRight,
          end: AlignmentGeometry.centerLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          spacing: 8,
          children: [
            ImageIcon(
              AssetImage(AppAssets.hashtagIcon),
              color: Colors.white,
              size: 16,
            ),
            Text(
              item.title!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppSolidColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

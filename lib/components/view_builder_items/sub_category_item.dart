import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/models/data_models.dart';

class SubCategoryItemRegisterPage extends StatelessWidget {
  final HashTag item;
  final VoidCallback onDelete;
  const SubCategoryItemRegisterPage({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 3,
      decoration: BoxDecoration(
        color: AppSolidColors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Text(
              item.title!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppSolidColors.accent,
              ),
            ),
          ),
      
          IconButton(
            onPressed: onDelete,
            icon: const Icon(
              CupertinoIcons.trash, 
              color: AppSolidColors.accent,
              size: 20,
            )
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/small_controllers/bookmarked_controller.dart';

class SingleArticleAppbar extends StatelessWidget {

  final BookmarkedController bookmarkedController;

  const SingleArticleAppbar({super.key, required this.bookmarkedController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          // Back Arrow
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.arrow_right_to_line,
              color: Colors.white,
              size: 32,
            ),
          ),
      
          Row(
            children: [
              // Bookmark
              Obx(
                () => IconButton(
                  onPressed: () {
                    bookmarkedController.toggleBookMark();
                  },
                  icon: Icon(
                    bookmarkedController.isBookMarked.value == true
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              
              // Share
              IconButton(
                onPressed: () async {
                  await SharePlus.instance.share(
                    ShareParams(
                      title: AppStrings.shareDialogTitleText,
                      text: AppStrings.shareDescriptionText,
                    ),
                  );
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
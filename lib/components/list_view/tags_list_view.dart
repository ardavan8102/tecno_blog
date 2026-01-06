import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/list_view/tags_list_view_item.dart';
import 'package:tecno_blog/core/controller/article/list_article_controller.dart';
import 'package:tecno_blog/core/models/tags_model.dart';

class ArticleTagsListView extends StatelessWidget {
  const ArticleTagsListView({
    super.key,
    required this.articleController,
    required this.articleItem,
  });

  final ListArticleController articleController;
  final RxList<TagsModel> articleItem;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Obx(
        () => ListView.builder(
          scrollDirection: .horizontal,
          itemCount: articleItem.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: articleItem.length -1 == index 
              ? const EdgeInsets.only(right: 8)
              : index == 0 
              ? const EdgeInsets.only(left: 8)
              : const EdgeInsets.only(right: 8, left: 8),
              child: TagsListViewItem(articleController: articleController, articleTag: articleItem, index: index),
            );
          }
        ),
      ),
    );
  }
}
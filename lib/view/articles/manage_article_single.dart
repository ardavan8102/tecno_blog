import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/buttons/choose_image_for_article.dart';
import 'package:tecno_blog/components/loading_cube.dart';
import 'package:tecno_blog/components/section/text_back_button_appbar.dart';
import 'package:tecno_blog/components/section_title.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/controller/article/article_management_controller.dart';

class ArticleSingleManagementPage extends StatelessWidget {
  ArticleSingleManagementPage({super.key});

  final ArticleManagementController articleManagementController = Get.find<ArticleManagementController>();
  

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    var size = MediaQuery.of(context).size;

    final article = articleManagementController.articleInfoModel.value;

    return Scaffold(
      appBar: TextAndBackButtonAppBar(textTheme: textTheme, label: 'مقاله جدید'),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // choose image
              Stack(
                children: [
                  // image
                  CachedNetworkImage(
                    imageUrl: article.image == '' || article.image == null
                      ? AppAssets.networkPlaceholderAsset
                      : article.image!,
              
                    imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                    placeholder: (context, url) => const LoadingCube(),
                    errorWidget: (context, url, error) => Image.network(AppAssets.networkPlaceholderAsset),
                  ),
              
                  // change button
                  Positioned(
                    bottom: 0,
                    right: size.width * .2,
                    left: size.width * .2,
                    child: ChooseImageForArticleButton(textTheme: textTheme),
                  ),
                ],
              ),
            
              const SizedBox(height: 20),

              // change title
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CustomSectionTitle(text: 'عنوان مقاله', assetName: AppAssets.penIcon),

                    const SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: article.title,
                        labelStyle: textTheme.labelSmall!.copyWith(
                          color: Colors.grey
                        ),
                        hintText: 'میتونی عنوان خودتو بنویسی',
                        hintStyle: textTheme.labelMedium!.copyWith(
                          color: Colors.grey.shade700
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // change description
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CustomSectionTitle(text: 'محتوای مقاله', assetName: AppAssets.penIcon),

                    const SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: article.content,
                        labelStyle: textTheme.labelSmall!.copyWith(
                          color: Colors.grey
                        ),
                        hintText: 'میتونی محتوای خودتو بنویسی',
                        hintStyle: textTheme.labelMedium!.copyWith(
                          color: Colors.grey.shade700
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
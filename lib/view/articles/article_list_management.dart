import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/buttons/elevated_button.dart';
import 'package:tecno_blog/components/loading_cube.dart';
import 'package:tecno_blog/components/section/text_back_button_appbar.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/core/controller/article/article_management_controller.dart';
import 'package:tecno_blog/core/routes/app_pages.dart';

class ArticleListManagementPage extends StatelessWidget {
  ArticleListManagementPage({super.key});
  
  final ArticleManagementController articleManagementController = Get.find<ArticleManagementController>();

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TextAndBackButtonAppBar(textTheme: textTheme, label: 'مدیریت مقاله ها'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Obx(
            () => articleManagementController.isLoading.value
              ? const Center(child: LoadingCube())
              : articleManagementController.articleList.isNotEmpty
                ? Stack(
                  children: [
                    ListView.builder(
                      itemCount: articleManagementController.articleList.length,
                      itemBuilder: (context, index) {
                        final article = articleManagementController.articleList[index];
                    
                        return Container(
                          margin: index == articleManagementController.articleList.length - 1
                            ? EdgeInsets.only(bottom: size.height * .08)
                            : const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () async {
                              // Route to single management
                            },
                            child: Padding(
                              padding: const EdgeInsetsGeometry.all(8),
                              child: Row(
                                spacing: 12,
                                children: [
                                  // Image
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(article.image!),
                                        fit: .cover
                                      ),
                                      borderRadius: .circular(12),
                                    ),
                                    height: 100,
                                    width: 100,
                                  ),
                          
                                  Column(
                                    crossAxisAlignment: .start,
                                    children: [
                                      // Title
                                      SizedBox(
                                        width: size.width * .5,
                                        child: Text(
                                          article.title!,
                                          maxLines: 1,
                                          overflow: .ellipsis,
                                        ),
                                      ),
                          
                                      // Category
                                      Text(article.catName!),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // write new
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white,
                        child: CustomElevatedButton(
                          label: 'یه مقاله جدید بنویس',
                          func: () {
                            Get.toNamed(AppRoutes.articleSingleManagement);
                          }, 
                        ),
                      ),
                    ),
                  ],
                )
                : articleListEmptyState(textTheme),
          ),
        )
      ),
    );
  }

  Column articleListEmptyState(TextTheme textTheme) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                AppAssets.tecnoBotSad,
                width: 120 ,
                height: 120 ,
              ),
          
              const SizedBox(height: 20),
                    
              Text(
                AppStrings.noArticleUploadedText,
                textAlign: .center,
                style: textTheme.labelSmall!.copyWith(
                  color: Colors.black,
                  height: 2
                ),
              ),

              const SizedBox(height: 50),

              CustomElevatedButton(
                label: 'اولین مقاله رو بنویس',
                func: () {
                  Get.toNamed(AppRoutes.articleSingleManagement);
                }, 
              ),
            ],
          ),
        ),
      ],
    );
  }
}


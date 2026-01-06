import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tecno_blog/components/section/text_back_button_appbar.dart';
import 'package:tecno_blog/core/controller/article/article_management_controller.dart';

class HtmlContentEditorPage extends StatelessWidget {
  HtmlContentEditorPage({super.key});

  final HtmlEditorController _htmlEditorController = HtmlEditorController();

  final ArticleManagementController articleManagementController = Get.find<ArticleManagementController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          _htmlEditorController.clearFocus();
        }
      },
      child: Scaffold(
        appBar: TextAndBackButtonAppBar(label: 'توضیحات مقاله'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              HtmlEditor(
                controller: _htmlEditorController,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'مقاله خودتو بنویس',
                  shouldEnsureVisible: true,
                  initialText: articleManagementController.articleInfoModel.value.content,
                ),
                callbacks: Callbacks(
                  onChangeContent: (onChangedValue) {
                    articleManagementController.articleInfoModel.update((value) {
                      value!.content = onChangedValue;
                    }) ;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
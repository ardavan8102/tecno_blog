import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecno_blog/components/buttons/elevated_button.dart';
import 'package:tecno_blog/components/section/text_back_button_appbar.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/strings.dart';

class ArticleListManagementPage extends StatelessWidget {
  const ArticleListManagementPage({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: TextAndBackButtonAppBar(textTheme: textTheme),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: articleListEmptyState(textTheme),
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
            ],
          ),
        ),
    
        CustomElevatedButton(
          label: 'اولین مقاله رو بنویس',
          func: () {
        
          }, 
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:tecno_blog/components/section/text_back_button_appbar.dart';

class ArticleSingleManagementPage extends StatelessWidget {
  const ArticleSingleManagementPage({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TextAndBackButtonAppBar(textTheme: textTheme, label: 'مقاله جدید'),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          height: size.height,
          width: size.width,
          child: Text('data'),
        )
      ),
    );
  }
}
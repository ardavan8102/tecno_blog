import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tecno_blog/components/loading_cube.dart';

class HtmlTextWidget extends StatelessWidget {
  final String text;

  const HtmlTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      text,
      textStyle: Theme.of(context).textTheme.bodySmall,
      enableCaching: true,
      onLoadingBuilder: (context, element, loadingProgress) => Center(child: LoadingCube()),
    );
  }
}
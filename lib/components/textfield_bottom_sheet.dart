import 'package:flutter/material.dart';
import 'package:tecno_blog/components/elevated_button.dart';

class InputBottomSheet extends StatelessWidget {
  final TextField field;
  final String title;
  final String buttonLabel;
  final Function() buttonFunction;
  final double height;

  const InputBottomSheet({
    super.key,
    required this.field,
    required this.title,
    required this.buttonLabel,
    required this.buttonFunction,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text(title, style: textTheme.bodyMedium),

            Padding(padding: const EdgeInsets.all(24), child: field),

            CustomElevatedButton(label: buttonLabel, func: buttonFunction),
          ],
        ),
      ),
    );
  }
}

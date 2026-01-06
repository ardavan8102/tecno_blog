import 'package:flutter/material.dart';

class LightGreyDivider extends StatelessWidget {
  final double spaceFromStart;
  final double spaceFromEnd;
  const LightGreyDivider({super.key, required this.spaceFromStart, required this.spaceFromEnd});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: spaceFromStart,
      endIndent: spaceFromEnd,
      color: Colors.grey.shade300,
    );
  }
}
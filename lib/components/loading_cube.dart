import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tecno_blog/consts/colors.dart';

class LoadingCube extends StatelessWidget {
  const LoadingCube({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: AppSolidColors.primary,
      size: 32,
    );
  }
}
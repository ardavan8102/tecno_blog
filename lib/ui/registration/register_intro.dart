import 'package:flutter/material.dart';
import 'package:tecno_blog/components/elevated_continue_button.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecno_blog/consts/strings.dart';

class RegisterIntroPage extends StatelessWidget {
  const RegisterIntroPage({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [

              // Tecno Bot Image
              SvgPicture.asset(
                AppAssets.tecnoBotSmile,
                width: 120 ,
                height: 120 ,
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(right: 80, left: 80),
                child: RichText(
                  textDirection: TextDirection.rtl,
                  textAlign: .center,
                  text: TextSpan(
                    text: '${AppStrings.welcomeText}\n',
                    style: textTheme.bodyLarge,
                    children: [
                      
                      TextSpan(text: '\n'),

                      TextSpan(
                        text: AppStrings.welcomeSubText,
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Button
              ElevatedContinueButton(
                label: 'بزن بریم',
                func: () {}, 
                bgColor: AppSolidColors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tecno_blog/components/elevated_button.dart';
import 'package:tecno_blog/components/textfield_bottom_sheet.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecno_blog/consts/strings.dart';

class RegisterIntroPage extends StatelessWidget {
  const RegisterIntroPage({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

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

              // Title & Subtitle
              registerIntroTitleAndSubtitle(textTheme),

              const SizedBox(height: 40),

              // Button
              CustomElevatedButton(
                label: 'بزن بریم',
                func: () {
                  bottomSheetEmail(
                    context,
                    size
                  );
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Email Bottom Sheet
  Future<dynamic> bottomSheetEmail(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, 
      builder: (context) {
        return InputBottomSheet(
          field: emailTextFieldInput(),
          title: AppStrings.enterYourEmail,
          buttonLabel: 'ادامه',
          buttonFunction: () {},
          height: size.height / 2.5,
        );
      },
    );
  }

  // Email Text Field
  TextField emailTextFieldInput() {
    return TextField(
      textAlign: .center,
      decoration: InputDecoration(
        hintText: 'tecno@gmail.com',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  // Title & Subtitle : Intro
  Padding registerIntroTitleAndSubtitle(TextTheme textTheme) {
    return Padding(
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
    );
  }
}
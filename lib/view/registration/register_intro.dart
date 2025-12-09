import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/buttons/elevated_button.dart';
import 'package:tecno_blog/components/snackbars.dart';
import 'package:tecno_blog/components/textfield_bottom_sheet.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/register_controller.dart';
import 'package:validators/validators.dart';

class RegisterIntroPage extends StatefulWidget {
  const RegisterIntroPage({super.key});

  @override
  State<RegisterIntroPage> createState() => _RegisterIntroPageState();
}

class _RegisterIntroPageState extends State<RegisterIntroPage> {

  bool isEmailOk = false;
  bool isEmailConfirmed = false;

  RegisterController registerController = Get.find<RegisterController>();

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
                  _bottomSheetEmail(
                    context,
                    size,
                    textTheme
                  );
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validate Bottom Sheet
  Future<dynamic> _bottomSheetValidate(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, 
      builder: (context) {
        return InputBottomSheet(
          field: validateTextFieldInput(textTheme),
          title: AppStrings.confirmYourEmail,
          buttonLabel: 'ادامه',
          buttonFunction: () {

            if (isEmailConfirmed) {
              Navigator.of(context).pop(); // close prevoius bottom sheet

              registerController.verify();

              AppSnackBars.success('ایمیل شما تایید شد');
            }
          },
          height: size.height / 2.5,
        );
      },
    );
  }

  // Email Bottom Sheet
  Future<dynamic> _bottomSheetEmail(BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context, 
      builder: (context) {
        return InputBottomSheet(
          field: emailTextFieldInput(textTheme),
          title: AppStrings.enterYourEmail,
          buttonLabel: 'ادامه',
          buttonFunction: () {
            if (isEmailOk) {

              registerController.register();

              Navigator.of(context).pop(); // close prevoius bottom sheet

              AppSnackBars.success('کد برای ایمیل ارسال شد');

              _bottomSheetValidate(context, size, textTheme);
            } else {
              AppSnackBars.failed('ایمیل معتبر نمیباشد');
            }
          },
          height: size.height / 2.5,
        );
      },
    );
  }

  // Email Text Field
  TextField emailTextFieldInput(TextTheme textTheme) {

    return TextField(
      controller: registerController.emailTextEditingController,
      onChanged: (value) {
        setState(() {
          isEmailOk = isEmail(value);
        });
      },
      style: textTheme.bodyMedium,
      textAlign: .center,
      decoration: InputDecoration(
        hintText: 'tecno@gmail.com',
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
    );
  }

  // Validation Text Field
  TextField validateTextFieldInput(TextTheme textTheme) {

    return TextField(
      controller: registerController.activationCodeEditingController,
      onChanged: (value) {
        setState(() {
          isEmailConfirmed = isNumeric(value);
        });
      },
      style: textTheme.bodyMedium,
      textAlign: .center,
      decoration: InputDecoration(
        hintText: '*  *  *  *  *  *',
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
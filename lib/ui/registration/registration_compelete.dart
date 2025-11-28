import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:validators/validators.dart';

class RegistrationCompeletePage extends StatefulWidget {
  const RegistrationCompeletePage({super.key});

  @override
  State<RegistrationCompeletePage> createState() => _RegistrationCompeletePageState();
}

class _RegistrationCompeletePageState extends State<RegistrationCompeletePage> {

  bool isFirstNameAndLastNameAlpha = false;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                // Bot Image
                SvgPicture.asset(
                  AppAssets.tecnoBotSmile,
                  width: 130,
                  height: 130,
                ),
          
                const SizedBox(height: 20),
          
                // Field Rich Text
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.emailSubmitedSuccessfully,
                        style: textTheme.bodyMedium,
                      ),
          
                      TextSpan(
                        text: '\n'
                      ),
          
                      TextSpan(
                        text: AppStrings.pleaseFillProfileInformation,
                        style: textTheme.bodyMedium,
                      ),
                    ]
                  ),
                ),
              
                const SizedBox(height: 20),
          
                // Text Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height / 15),
                  child: firstNameAndLastNameTextField(textTheme),
                ),
          
                const SizedBox(height: 40),
          
                // Categories : Title
                Text(
                  AppStrings.chooseYourFavoriteCategories,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700
                  ),
                  textAlign: .center,
                ),
          
                // Categories : Lists

              ],
            ),
          ),
        )
      ),
    );
  }


  // first Name And Last Name Text Field
  TextField firstNameAndLastNameTextField(TextTheme textTheme) {
    return TextField(
      onChanged: (value) {
        setState(() {
          isFirstNameAndLastNameAlpha = isAlpha(value);
        });
      },
      decoration: InputDecoration(
        hintText: AppStrings.firstNameAndLastName,
        hintStyle: textTheme.bodySmall,
        suffixIcon: Icon(
          Icons.person,
          size: 32,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}
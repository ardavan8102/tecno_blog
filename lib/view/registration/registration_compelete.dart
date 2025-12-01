import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/components/buttons/elevated_button.dart';
import 'package:tecno_blog/components/snackbars.dart';
import 'package:tecno_blog/components/view_builder_items/category_item.dart';
import 'package:tecno_blog/components/view_builder_items/sub_category_item.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/strings.dart';
import 'package:tecno_blog/controller/home_controller.dart';
import 'package:tecno_blog/models/data_models.dart';
import 'package:tecno_blog/models/fake_data.dart';

class RegistrationCompeletePage extends StatefulWidget {
  const RegistrationCompeletePage({super.key});

  @override
  State<RegistrationCompeletePage> createState() => _RegistrationCompeletePageState();
}

class _RegistrationCompeletePageState extends State<RegistrationCompeletePage> {

  String username = '';
  bool isNameEmpty = true;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
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

                const SizedBox(height: 20),
                      
                // Categories : Lists
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: categoriesGridViewBuilder(),
                  ),
                ),
              
                const SizedBox(height: 20),

                // Arrow Image
                SvgPicture.asset(
                  AppAssets.arrowDown,
                  height: 50,
                  width: 50,
                ),
                
                const SizedBox(height: 20),

                // Sub Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: subCategoryGridViewBuilder(),
                  ),
                ),

                const SizedBox(height: 50),

                // Button
                CustomElevatedButton(
                  label: 'ادامه',
                  func: () {
                    if (isNameEmpty) {
                      AppSnackBars.failed('نام خود را وارد کنید');
                    } else {
                      AppSnackBars.success('$username خوش اومدی دوست من');
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  // Sub Category Grid View
  GridView subCategoryGridViewBuilder() {
    return GridView.builder(
      scrollDirection: .horizontal,
      itemCount: subCategoriesRegisterPage.length,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 0.3,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final item = subCategoriesRegisterPage[index];
        return SubCategoryItemRegisterPage(
          item: item,
          onDelete: () {
            setState(() {
              subCategoriesRegisterPage.removeAt(index);
            });
          },
        );
      },
    );
  }

  // Categories Grid View
  GridView categoriesGridViewBuilder() {
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      scrollDirection: .horizontal,
      itemCount: tagList.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final item = Get.find<HomeController>().tagsList[index];
        return InkWell(
          onTap: () {
            // Check if tag already exists in the list:
            final alreadyExits = subCategoriesRegisterPage.any(
              (tag) => tag.title == item.title
            );

            if (!alreadyExits) {
              setState(() {
                subCategoriesRegisterPage.add(
                  HashTag(title: item.title)
                );
              });
            } else {
              AppSnackBars.failed('این دسته قبلاً انتخاب شده');
            }
          },
          child: CategoryTagListItem(
            hashTagItem: item,
            index: index
          ),
        );
      },
    );
  }


  // first Name And Last Name Text Field
  TextField firstNameAndLastNameTextField(TextTheme textTheme) {
    return TextField(
      onChanged: (value) {
        setState(() {
          username = value;
          if (value.isNotEmpty) {
            isNameEmpty = false;
          } else {
            isNameEmpty = true;
          }
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
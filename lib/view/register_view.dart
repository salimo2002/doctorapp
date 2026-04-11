import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/text_field_label.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'register_view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoratedBackground(context),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  Image.asset('assets/images/211.png', width: 150),
                  SizedBox(height: 10),
                  Text(
                    'المستشار الذكي',
                    style: AppStyle.containerText(
                      context,
                      AppStyle.h2,
                      FontWeight.bold,
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'انشاء حساب جديد',
                    style: AppStyle.customText(
                      context,
                      AppStyle.h3,
                      FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'انشئ حسابك واستمتع بخدماتنا',
                    style: AppStyle.customText(
                      context,
                      AppStyle.h3,
                      FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldLabel(label: 'الاسم الكامل'),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: nameController,
                    focusNode: nameFocus,
                    hint: 'ادخل الاسم الكامل',
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldLabel(label: 'البريد الالكتروني'),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    hint: 'ادخل البريد الالكتروني',
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldLabel(label: 'كلمة المرور'),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    hint: 'ادخل كلمة المرور',
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFieldLabel(label: 'تأكيد كلمة المرور'),
                  SizedBox(height: 5),
                  ChatTextField(
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocus,
                    hint: 'أعد ادخال كلمة المرور',
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    label: 'انشاء حساب',
                    onPressed: () {
                      Navigator.pushNamed(context, MainViews.id);
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'تسجيل الدخول',
                          style: AppStyle.containerText(
                            context,
                            18,
                            FontWeight.bold,
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'لديك حساب؟',
                        style: AppStyle.customText(
                          context,
                          18,
                          FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

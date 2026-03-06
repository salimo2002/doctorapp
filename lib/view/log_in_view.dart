import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/view/register_view.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/text_field_label.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static String id = 'log_in_view';
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
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  Image.asset('assets/images/211.png', width: 150),
                  SizedBox(height: 10),
                  Text(
                    'المستشار الذكي',
                    style: AppStyle.containerText(
                      context,
                      28,
                      FontWeight.bold,
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'مرحبا بعودتك',
                    style: AppStyle.customText(context, 28, FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'سجل دخولك للوصول الى ادويتك',
                    style: AppStyle.customText(context, 18, FontWeight.normal),
                  ),
                  SizedBox(height: 10),
                  TextFieldLabel(label: 'البريد الالكتروني'),
                  SizedBox(height: 5),
                  ChatTextField(
                    focusNode: FocusNode(),
                    message: TextEditingController(),
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
                    focusNode: FocusNode(),
                    message: TextEditingController(),
                    hint: 'ادخل كلمة المرور',
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: AppStyle.containerText(
                            context,
                            18,
                            FontWeight.bold,
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    label: 'تسجيل الدخول',
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
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: Text(
                          'سجل الان',
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
                        'ليس لديك حساب؟',
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

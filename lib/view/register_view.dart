import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:doctorapp/widgets/custom_button.dart';
import 'package:doctorapp/widgets/text_field_label.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'register_view';

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
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Icon(
                    Icons.piano,
                    color: Theme.of(context).colorScheme.primary,
                    size: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'الصيدلية الذكية',
                    style: AppStyle.containerText(
                      context,
                      28,
                      FontWeight.bold,
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'انشاء حساب جديد',
                    style: AppStyle.customText(context, 28, FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'انشئ حسابك واستمتع بخدماتنا',
                    style: AppStyle.customText(context, 18, FontWeight.normal),
                  ),
                  SizedBox(height: 20),
                  TextFieldLabel(label: 'الاسم الكامل'),
                  SizedBox(height: 5),
                  ChatTextField(
                    message: TextEditingController(),
                    hint: 'ادخل الاسم الكامل',
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFieldLabel(label: 'البريد الالكتروني'),
                  SizedBox(height: 5),
                  ChatTextField(
                    message: TextEditingController(),
                    hint: 'ادخل البريد الالكتروني',
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFieldLabel(label: 'كلمة المرور'),
                  SizedBox(height: 5),
                  ChatTextField(
                    message: TextEditingController(),
                    hint: 'ادخل كلمة المرور',
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFieldLabel(label: 'تأكيد كلمة المرور'),
                  SizedBox(height: 5),
                  ChatTextField(
                    message: TextEditingController(),
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

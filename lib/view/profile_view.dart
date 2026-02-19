import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/dark_or_light_mode.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Column(
          children: [
            Center(
              child: Text(
                'حسابي',
                style: AppStyle.customText(context, 28, FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            Image.asset(
              'assets/images/user.png',
              height: 150,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              'اسم المستخدم',
              style: AppStyle.customText(context, 26, FontWeight.bold),
            ),
            Text(
              'salimosalim31@gmail.com',
              style: AppStyle.customText(context, 18, FontWeight.bold),
            ),
            CustomContainer(
              cheldreen: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_outlined),
                    Spacer(),
                    Text(
                      'الملف الشخصي',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.person_outline),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_outlined),
                    Spacer(),
                    Text(
                      'معلومات تسجيل الدخول',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.login_outlined),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_outlined),
                    Spacer(),
                    Text(
                      'سياسة الاستخدام',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.policy_outlined),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_outlined),
                    Spacer(),
                    Text(
                      'حول التطبيق',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.info_outline),
                  ],
                ),
                SizedBox(height: 16),
                DarkOrLightMode(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

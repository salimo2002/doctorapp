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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                'حسابي',
                style: AppStyle.customText(context, 28, FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            Icon(Icons.person, size: 80),
            Text(
              'براءة الديب',
              style: AppStyle.customText(context, 26, FontWeight.bold),
            ),
            CustomContainer(
              cheldreen: [
                Row(
                  children: [
                    Icon(Icons.person_outline),
                    Spacer(),
                    Text(
                      'الملف الشخصي',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.login_outlined),
                    Spacer(),
                    Text(
                      'معلومات تسجيل الدخول',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.warning_amber_outlined),
                    Spacer(),
                    Text(
                      'سياسة الاستخدام',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.info_outline),
                    Spacer(),
                    Text(
                      'حول التطبيق',
                      style: AppStyle.customText(context, 20, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                DarkOrLightMode(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

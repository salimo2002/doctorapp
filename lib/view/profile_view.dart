import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/personal_info_view.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/dark_or_light_mode.dart';
import 'package:doctorapp/widgets/setting_action.dart';
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
                style: AppStyle.customText(
                  context,
                  AppStyle.h1,
                  FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/211.png', width: 150),
                      SizedBox(height: 5),
                      Text(
                        'سليم محمد عويجان',
                        style: AppStyle.customText(
                          context,
                          AppStyle.h2,
                          FontWeight.bold,
                        ),
                      ),
                      Text(
                        'salimosalim31@gmail.com',
                        style: AppStyle.customText(
                          context,
                          AppStyle.title2,
                          FontWeight.bold,
                        ),
                      ),
                      CustomContainer(
                        cheldreen: [
                          SettingAction(
                            icon: Icons.person_outline,
                            title: 'الملف الشخصي',
                            ontap: () {
                              Navigator.pushNamed(context, PersonalInfoView.id);
                            },
                          ),
                          SizedBox(height: 18),
                          SettingAction(
                            icon: Icons.policy_outlined,
                            title: 'سياسة الاستخدام',
                            ontap: () {},
                          ),

                          SizedBox(height: 18),
                          SettingAction(
                            icon: Icons.info_outline,
                            title: 'حول التطبيق',
                            ontap: () {},
                          ),
                          SizedBox(height: 16),
                          DarkOrLightMode(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

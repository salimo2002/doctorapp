import 'package:doctorapp/cubits/profileCubit/profile_cubit.dart';
import 'package:doctorapp/cubits/profileCubit/profile_state.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/view/about_app_view.dart';
import 'package:doctorapp/view/password_reset_view.dart';
import 'package:doctorapp/view/personal_info_view.dart';
import 'package:doctorapp/view/usage_policy_view.dart';
import 'package:doctorapp/widgets/custom_container.dart';
import 'package:doctorapp/widgets/dark_or_light_mode.dart';
import 'package:doctorapp/widgets/setting_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
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
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/211.png', width: 150),
                      SizedBox(height: 5),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoaded) {
                            return Text(
                              state.user.fullName!,
                              style: AppStyle.customText(
                                context,
                                AppStyle.h2,
                                FontWeight.bold,
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoaded) {
                            return Text(
                              '+${state.user.phoneNumber}',
                              style: AppStyle.customText(
                                context,
                                AppStyle.title2,
                                FontWeight.bold,
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                      SizedBox(height: 20),
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
                            icon: Icons.lock_outline,
                            title: 'تغيير كلمة المرور',
                            ontap: () {
                              Navigator.pushNamed(
                                context,
                                PasswordResetView.id,
                              );
                            },
                          ),
                          SizedBox(height: 18),
                          SettingAction(
                            icon: Icons.policy_outlined,
                            title: 'سياسة الاستخدام',
                            ontap: () {
                              Navigator.pushNamed(context, UsagePolicyView.id);
                            },
                          ),
                          SizedBox(height: 18),
                          SettingAction(
                            icon: Icons.info_outline,
                            title: 'حول التطبيق',
                            ontap: () {
                              Navigator.pushNamed(context, AboutAppView.id);
                            },
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

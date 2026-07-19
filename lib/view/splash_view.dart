import 'dart:async';
import 'package:doctorapp/utils/app_preferences.dart';
import 'package:doctorapp/view/log_in_view.dart';
import 'package:doctorapp/view/main_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/authCubit/auth_cubit.dart';
import '../utils/app_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await AppPreferences.isLoggedIn();

    if (!mounted) return;

    if (isLoggedIn) {
      final userId = await AppPreferences.getUserId();

      if (userId != null) {
        await context.read<AuthCubit>().loadUserFromStorage(userId);
      }

      Navigator.pushReplacementNamed(context, MainViews.id);
    } else {
      Navigator.pushReplacementNamed(context, LogInView.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: AppStyle.decoratedBackground(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppStyle.appIcon, width: 120),
            const SizedBox(height: 20),
            Text(
              "المستشار الطبي",
              style: AppStyle.customText(
                context,
                AppStyle.h1,
                FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "استشارة دوائية ذكية",
              style: AppStyle.customText(
                context,
                AppStyle.body,
                FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
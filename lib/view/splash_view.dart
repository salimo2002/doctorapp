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

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeOutBack,
      ),
    );

    _fadeController.forward();
    _scaleController.forward();

    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 3));

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
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: AppStyle.decoratedBackground(context),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  AppStyle.appIcon,
                  width: 130,
                ),
              ),
              const SizedBox(height: 25),
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
              const SizedBox(height: 40),
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color:
                      Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}